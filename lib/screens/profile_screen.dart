import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_colors.dart';
import '../data/demo_store.dart';
import '../utils/app_reload.dart';
import '../widgets/common.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _soon(BuildContext context, String what) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('$what — скоро (демо)')));
  }

  @override
  Widget build(BuildContext context) {
    const me = DemoStore.me;
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
      children: [
        Text(
          'Профиль',
          style: GoogleFonts.manrope(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: AppColors.ink,
          ),
        ),
        const SizedBox(height: 14),
        AppCard(
          child: Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.primarySoft,
                child: Icon(Icons.person_rounded,
                    size: 32, color: AppColors.primary),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(me.fullName,
                        style: GoogleFonts.manrope(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: AppColors.ink)),
                    const SizedBox(height: 4),
                    const Pill(text: 'Admin', color: AppColors.primary),
                    const SizedBox(height: 6),
                    Text(me.company,
                        style: GoogleFonts.manrope(color: AppColors.muted)),
                    Text(me.phone,
                        style: GoogleFonts.manrope(color: AppColors.muted)),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        if (me.isAdmin) ...[
          const SectionTitle('Компания'),
          _MenuTile(
              icon: Icons.business_rounded,
              title: 'Настройки компании',
              onTap: () => _soon(context, 'Настройки компании')),
          _MenuTile(
              icon: Icons.groups_rounded,
              title: 'Управление менеджерами',
              onTap: () => _soon(context, 'Менеджеры')),
          _MenuTile(
              icon: Icons.workspace_premium_rounded,
              title: 'Подписка',
              trailing: const Pill(text: 'Trial · 14 дней', color: AppColors.warning),
              onTap: () => _soon(context, 'Подписка')),
        ],
        const SectionTitle('Отчёты'),
        _MenuTile(
            icon: Icons.picture_as_pdf_outlined,
            title: 'Экспорт PDF',
            onTap: () => _soon(context, 'Экспорт PDF')),
        _MenuTile(
            icon: Icons.table_chart_outlined,
            title: 'Экспорт Excel',
            onTap: () => _soon(context, 'Экспорт Excel')),
        const SectionTitle('Прочее'),
        _MenuTile(
            icon: Icons.refresh_rounded,
            title: 'Обновить приложение',
            onTap: reloadApp),
        _MenuTile(
            icon: Icons.history_rounded,
            title: 'Журнал действий',
            onTap: () => _soon(context, 'Журнал действий')),
        _MenuTile(
            icon: Icons.privacy_tip_outlined,
            title: 'Политика конфиденциальности',
            onTap: () => _soon(context, 'Политика')),
        const SizedBox(height: 10),
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.error,
            side: const BorderSide(color: AppColors.border),
            minimumSize: const Size.fromHeight(52),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14)),
          ),
          onPressed: () => Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const LoginScreen()),
            (_) => false,
          ),
          icon: const Icon(Icons.logout_rounded),
          label: const Text('Выйти'),
        ),
      ],
    );
  }
}

class _MenuTile extends StatelessWidget {
  const _MenuTile({
    required this.icon,
    required this.title,
    required this.onTap,
    this.trailing,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: AppCard(
        onTap: onTap,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primary),
            const SizedBox(width: 12),
            Expanded(
              child: Text(title,
                  style: GoogleFonts.manrope(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppColors.ink)),
            ),
            if (trailing != null) ...[trailing!, const SizedBox(width: 6)],
            const Icon(Icons.chevron_right_rounded, color: AppColors.hint),
          ],
        ),
      ),
    );
  }
}
