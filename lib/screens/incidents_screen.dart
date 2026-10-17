import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_colors.dart';
import '../data/demo_store.dart';
import '../widgets/common.dart';
import 'dashboard_screen.dart';

class IncidentsScreen extends StatefulWidget {
  const IncidentsScreen({super.key});

  @override
  State<IncidentsScreen> createState() => _IncidentsScreenState();
}

class _IncidentsScreenState extends State<IncidentsScreen> {
  Category? _category;
  Severity? _severity;

  @override
  Widget build(BuildContext context) {
    final store = DemoStore.instance;
    return ListenableBuilder(
      listenable: store,
      builder: (context, _) {
        final items = store.latest
            .where((i) =>
                (_category == null || i.category == _category) &&
                (_severity == null || i.severity == _severity))
            .toList();
        return ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
          children: [
            Text(
              'Лента инцидентов',
              style: GoogleFonts.manrope(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: AppColors.ink,
              ),
            ),
            const SizedBox(height: 14),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                FilterChip(
                  label: const Text('Все'),
                  selected: _category == null,
                  onSelected: (_) => setState(() => _category = null),
                ),
                for (final c in Category.values)
                  FilterChip(
                    label: Text(c.label),
                    selected: _category == c,
                    onSelected: (s) =>
                        setState(() => _category = s ? c : null),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final s in Severity.values)
                  FilterChip(
                    label: Text(s.label),
                    avatar: CircleAvatar(
                        backgroundColor: s.color, radius: 5),
                    selected: _severity == s,
                    onSelected: (v) =>
                        setState(() => _severity = v ? s : null),
                  ),
              ],
            ),
            const SizedBox(height: 18),
            if (items.isEmpty)
              AppCard(
                child: Center(
                  child: Text('Нет инцидентов по выбранным фильтрам',
                      style: GoogleFonts.manrope(color: AppColors.muted)),
                ),
              ),
            for (final i in items) ...[
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
