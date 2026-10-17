import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_colors.dart';
import '../data/demo_store.dart';
import '../widgets/common.dart';
import 'client_card_screen.dart';

void openClient(BuildContext context, String clientId) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (_) => ClientCardScreen(clientId: clientId)),
  );
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key, required this.onOpenSearch});

  final VoidCallback onOpenSearch;

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
            AppCard(
              onTap: onOpenSearch,
              padding:
                  const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              child: Row(
                children: [
                  const Icon(Icons.search_rounded, color: AppColors.primary),
                  const SizedBox(width: 12),
                  Text(
                    'Введите ИИН, ФИО или телефон',
                    style: GoogleFonts.manrope(
                        fontSize: 15, color: AppColors.hint),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            AppCard(
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Сканирование прав появится позже'))),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.primarySoft,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.photo_camera_outlined,
                        color: AppColors.primary),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Сканировать права',
                    style: GoogleFonts.manrope(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppColors.ink,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.chevron_right_rounded,
                      color: AppColors.hint),
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
