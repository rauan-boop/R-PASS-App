import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_colors.dart';
import '../data/demo_store.dart';

extension RiskLevelStyle on RiskLevel {
  Color get color => switch (this) {
        RiskLevel.clean => AppColors.success,
        RiskLevel.attention => AppColors.warning,
        RiskLevel.blocked => AppColors.error,
      };

  String get label => switch (this) {
        RiskLevel.clean => 'Чисто',
        RiskLevel.attention => 'Внимание',
        RiskLevel.blocked => 'Высокий риск',
      };

  IconData get icon => switch (this) {
        RiskLevel.clean => Icons.check_circle_rounded,
        RiskLevel.attention => Icons.warning_amber_rounded,
        RiskLevel.blocked => Icons.gpp_bad_rounded,
      };

  String get advice => switch (this) {
        RiskLevel.clean =>
          'Нарушений в базе не найдено. Решение о выдаче принимает ваша компания.',
        RiskLevel.attention =>
          'Есть замечания от других компаний. Рекомендуем проверить детали перед выдачей.',
        RiskLevel.blocked =>
          'Есть серьёзные инциденты. Рекомендуем отказать или усилить проверку. Решение за вами.',
      };
}

class Pill extends StatelessWidget {
  const Pill({super.key, required this.text, required this.color, this.icon});

  final String text;
  final Color color;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: color),
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: GoogleFonts.manrope(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(16),
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [AppColors.cardShadow],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Padding(padding: padding, child: child),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 8, 4, 10),
      child: Text(
        text,
        style: GoogleFonts.manrope(
          fontSize: 17,
          fontWeight: FontWeight.w800,
          color: AppColors.ink,
        ),
      ),
    );
  }
}

class IncidentTile extends StatelessWidget {
  const IncidentTile({super.key, required this.incident, this.onTap});

  final Incident incident;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final client = DemoStore.instance.clientById(incident.clientId);
    final color = incident.severity.color;
    return AppCard(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(Icons.report_gmailerrorred_rounded, color: color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        incident.category.label,
                        style: GoogleFonts.manrope(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: AppColors.ink,
                        ),
                      ),
                    ),
                    if (incident.pending)
                      const Pill(text: 'На модерации', color: AppColors.muted),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  '${client.maskedName} · ${client.maskedIin}',
                  style: GoogleFonts.manrope(
                      fontSize: 13, color: AppColors.muted),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Pill(text: incident.severity.label, color: color),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        '${incident.company} · ${formatDate(incident.date)}',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.manrope(
                            fontSize: 12, color: AppColors.hint),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ClientTile extends StatelessWidget {
  const ClientTile({super.key, required this.client, this.onTap});

  final Client client;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final risk = DemoStore.instance.riskOf(client.id);
    return AppCard(
      onTap: onTap,
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: risk.color.withOpacity(0.14),
            child: Text(
              client.initials,
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w800,
                color: risk.color,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  client.maskedName,
                  style: GoogleFonts.manrope(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: AppColors.ink,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'ИИН: ${client.maskedIin}',
                  style: GoogleFonts.manrope(
                      fontSize: 13, color: AppColors.muted),
                ),
              ],
            ),
          ),
          Pill(text: risk.label, color: risk.color, icon: risk.icon),
        ],
      ),
    );
  }
}

class SkeletonBox extends StatelessWidget {
  const SkeletonBox({super.key, this.height = 72});
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: AppColors.border.withOpacity(0.6),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
