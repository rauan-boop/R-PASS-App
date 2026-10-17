import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_colors.dart';
import '../data/demo_store.dart';
import '../widgets/common.dart';

class ClientCardScreen extends StatefulWidget {
  const ClientCardScreen({super.key, required this.clientId});

  final String clientId;

  @override
  State<ClientCardScreen> createState() => _ClientCardScreenState();
}

class _ClientCardScreenState extends State<ClientCardScreen> {
  bool _revealed = false;

  void _snack(String text) => ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(text)));

  Future<void> _reveal() async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Раскрыть данные?'),
        content: const Text(
            'Запрос будет записан в журнал аудита. Раскрывайте данные только при необходимости.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Отмена')),
          FilledButton(
            style: FilledButton.styleFrom(minimumSize: const Size(110, 44)),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Раскрыть'),
          ),
        ],
      ),
    );
    if (ok == true) setState(() => _revealed = true);
  }

  Future<void> _appeal() async {
    final c = TextEditingController();
    final sent = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Апелляция'),
        content: TextField(
          controller: c,
          maxLines: 4,
          decoration: const InputDecoration(
              hintText: 'Опишите, почему запись неверна'),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Отмена')),
          FilledButton(
            style: FilledButton.styleFrom(minimumSize: const Size(110, 44)),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Отправить'),
          ),
        ],
      ),
    );
    c.dispose();
    if (sent == true) {
      _snack('Апелляция передана компании-автору. Срок рассмотрения — 10 рабочих дней.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final store = DemoStore.instance;
    final client = store.clientById(widget.clientId);
    final risk = store.riskOf(client.id);
    final incidents = store.incidentsOf(client.id);
    final name = _revealed ? client.fullName : client.maskedName;
    final iin = _revealed ? client.iin : client.maskedIin;
    final phone = _revealed ? '+${client.phone}' : client.maskedPhone;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Карточка клиента'),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.ink,
        elevation: 0,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 40),
            children: [
              AppCard(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 34,
                      backgroundColor: risk.color.withOpacity(0.14),
                      child: Text(client.initials,
                          style: GoogleFonts.manrope(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: risk.color)),
                    ),
                    const SizedBox(height: 12),
                    Text(name,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.manrope(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: AppColors.ink)),
                    const SizedBox(height: 6),
                    Text('ИИН: $iin',
                        style: GoogleFonts.manrope(color: AppColors.muted)),
                    Text('Телефон: $phone',
                        style: GoogleFonts.manrope(color: AppColors.muted)),
                    const SizedBox(height: 12),
                    if (!_revealed)
                      TextButton.icon(
                        onPressed: DemoStore.me.isAdmin
                            ? _reveal
                            : () => _snack('Раскрытие доступно только Admin'),
                        icon: const Icon(Icons.visibility_outlined),
                        label: const Text('Подробнее'),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: risk.color.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: risk.color.withOpacity(0.35)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(risk.icon, color: risk.color, size: 30),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(risk.label,
                              style: GoogleFonts.manrope(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.ink)),
                          const SizedBox(height: 4),
                          Text(risk.advice,
                              style: GoogleFonts.manrope(
                                  fontSize: 13, color: AppColors.muted)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: FilledButton.icon(
                      style: FilledButton.styleFrom(
                          backgroundColor: AppColors.success),
                      onPressed: () => _snack('Решение «Выдать» записано'),
                      icon: const Icon(Icons.check_rounded),
                      label: const Text('Выдать'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton.icon(
                      style: FilledButton.styleFrom(
                          backgroundColor: AppColors.error),
                      onPressed: () => _snack('Решение «Отказать» записано'),
                      icon: const Icon(Icons.close_rounded),
                      label: const Text('Отказать'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              SectionTitle('Инциденты (${incidents.length})'),
              if (incidents.isEmpty)
                AppCard(
                  child: Text('Нарушений не зафиксировано',
                      style: GoogleFonts.manrope(color: AppColors.muted)),
                ),
              for (final i in incidents) ...[
                AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(i.category.label,
                                style: GoogleFonts.manrope(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.ink)),
                          ),
                          Pill(text: i.severity.label, color: i.severity.color),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(i.description,
                          style: GoogleFonts.manrope(
                              fontSize: 14, color: AppColors.ink)),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.apartment_rounded,
                              size: 16, color: AppColors.hint),
                          const SizedBox(width: 4),
                          Flexible(
                            child: Text(
                                '${i.company} · ${formatDate(i.date)}',
                                style: GoogleFonts.manrope(
                                    fontSize: 12, color: AppColors.muted)),
                          ),
                          if (i.photos > 0) ...[
                            const SizedBox(width: 12),
                            const Icon(Icons.photo_outlined,
                                size: 16, color: AppColors.hint),
                            const SizedBox(width: 4),
                            Text('${i.photos} фото',
                                style: GoogleFonts.manrope(
                                    fontSize: 12, color: AppColors.muted)),
                          ],
                          if (i.pending) ...[
                            const Spacer(),
                            const Pill(
                                text: 'На модерации', color: AppColors.muted),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
              if (incidents.isNotEmpty) ...[
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primaryDark,
                    side: const BorderSide(color: AppColors.border),
                    minimumSize: const Size.fromHeight(52),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                  ),
                  onPressed: _appeal,
                  icon: const Icon(Icons.gavel_rounded),
                  label: const Text('Подать апелляцию'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
