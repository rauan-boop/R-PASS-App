import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_colors.dart';
import '../data/demo_store.dart';
import '../widgets/common.dart';
import 'client_card_screen.dart';
import 'information_system_check_screen.dart';

void openClient(BuildContext context, String clientId) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (_) => ClientCardScreen(clientId: clientId)),
  );
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = DemoStore.instance;
    return ListenableBuilder(
      listenable: store,
      builder: (context, _) {
        final latest = store.latest.take(10).toList();
        return ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'R-PASS',
                        style: GoogleFonts.manrope(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          color: AppColors.ink,
                        ),
                      ),
                      Text(
                        DemoStore.me.company,
                        style: GoogleFonts.manrope(
                            fontSize: 13, color: AppColors.muted),
                      ),
                    ],
                  ),
                ),
                Badge(
                  label: const Text('3'),
                  child: IconButton.filledTonal(
                    onPressed: () => ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(
                            content: Text('Уведомлений пока нет (демо)'))),
                    icon: const Icon(Icons.notifications_none_rounded),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            LayoutBuilder(
              builder: (context, constraints) {
                final cardWidth = (constraints.maxWidth - 12) / 2;
                return Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    SizedBox(
                      width: cardWidth,
                      child: _DashboardStat(
                        icon: Icons.business_rounded,
                        label: 'Компаний в системе',
                        value: 128,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(
                      width: cardWidth,
                      child: _DashboardStat(
                        icon: Icons.groups_rounded,
                        label: 'Пользователей',
                        value: 364,
                        color: AppColors.primaryDark,
                      ),
                    ),
                    SizedBox(
                      width: cardWidth,
                      child: _DashboardStat(
                        icon: Icons.gpp_bad_rounded,
                        label: 'Записей в чёрном списке',
                        value: 1248,
                        color: AppColors.error,
                      ),
                    ),
                    SizedBox(
                      width: cardWidth,
                      child: _DashboardStat(
                        icon: Icons.history_rounded,
                        label: 'Обращений за последние сутки',
                        value: 86,
                        color: AppColors.primaryDark,
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const InformationSystemCheckScreen(),
                  ),
                ),
                icon: const Icon(Icons.fact_check_outlined),
                label: const Text('Проверка по информ. системам'),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                children: [
                  Icon(Icons.notifications_none_rounded,
                      size: 16, color: AppColors.muted),
                  const SizedBox(width: 6),
                  Text(
                    'До окончания подписки осталось 14 дней',
                    style: GoogleFonts.manrope(
                      fontSize: 12,
                      color: AppColors.muted,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const SectionTitle('Последние добавления'),
            for (final i in latest) ...[
              IncidentTile(
                incident: i,
                onTap: () => openClient(context, i.clientId),
              ),
              const SizedBox(height: 10),
            ],
          ],
        );
      },
    );
  }
}

class _DashboardStat extends StatelessWidget {
  const _DashboardStat({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  final IconData icon;
  final String label;
  final int value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(height: 10),
          Text(
            '$value',
            style: GoogleFonts.manrope(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: GoogleFonts.manrope(
              fontSize: 12,
              color: AppColors.muted,
            ),
          ),
        ],
      ),
    );
  }
}
