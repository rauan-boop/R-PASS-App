import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_colors.dart';
import '../data/demo_store.dart';
import '../widgets/common.dart';
import 'dashboard_screen.dart';

enum _Mode { iin, name, phone }

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  Timer? _debounce;
  _Mode _mode = _Mode.iin;
  bool _loading = false;
  String _query = '';
  List<Client> _results = [];

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    _debounce?.cancel();
    setState(() {
      _query = value.trim();
      _loading = _query.isNotEmpty;
    });
    _debounce = Timer(const Duration(milliseconds: 400), _search);
  }

  void _search() {
    if (!mounted) return;
    final q = _query;
    final digits = q.replaceAll(RegExp(r'\D'), '');
    final all = DemoStore.instance.clients;
    List<Client> found;
    switch (_mode) {
      case _Mode.iin:
        found = digits.length == 12
            ? all.where((c) => c.iin == digits).toList()
            : [];
      case _Mode.name:
        found = q.length < 2
            ? []
            : all
                .where((c) =>
                    c.fullName.toLowerCase().contains(q.toLowerCase()))
                .toList();
      case _Mode.phone:
        found = digits.length < 4
            ? []
            : all.where((c) => c.phone.contains(digits)).toList();
    }
    setState(() {
      _results = found;
      _loading = false;
    });
  }

  void _setMode(_Mode m) {
    _controller.clear();
    setState(() {
      _mode = m;
      _query = '';
      _results = [];
      _loading = false;
    });
  }

  String get _hint => switch (_mode) {
        _Mode.iin => 'Введите 12 цифр ИИН',
        _Mode.name => 'Фамилия или имя',
        _Mode.phone => 'Номер телефона',
      };

  String get _needMore => switch (_mode) {
        _Mode.iin => 'Для поиска по ИИН введите все 12 цифр.',
        _Mode.name => 'Введите минимум 2 символа.',
        _Mode.phone => 'Введите минимум 4 цифры.',
      };

  bool get _tooShort {
    final digits = _query.replaceAll(RegExp(r'\D'), '');
    return switch (_mode) {
      _Mode.iin => digits.length != 12,
      _Mode.name => _query.length < 2,
      _Mode.phone => digits.length < 4,
    };
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
      children: [
        Text(
          'Поиск и проверка',
          style: GoogleFonts.manrope(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: AppColors.ink,
          ),
        ),
        const SizedBox(height: 14),
        SegmentedButton<_Mode>(
          showSelectedIcon: false,
          segments: const [
            ButtonSegment(value: _Mode.iin, label: Text('ИИН')),
            ButtonSegment(value: _Mode.name, label: Text('ФИО')),
            ButtonSegment(value: _Mode.phone, label: Text('Телефон')),
          ],
          selected: {_mode},
          onSelectionChanged: (s) => _setMode(s.first),
          style: SegmentedButton.styleFrom(
            selectedBackgroundColor: AppColors.primarySoft,
            selectedForegroundColor: AppColors.primaryDark,
          ),
        ),
        const SizedBox(height: 14),
        TextField(
          controller: _controller,
          onChanged: _onChanged,
          keyboardType:
              _mode == _Mode.name ? TextInputType.text : TextInputType.number,
          inputFormatters: _mode == _Mode.name
              ? null
              : [FilteringTextInputFormatter.allow(RegExp(r'[0-9+ ()-]'))],
          decoration: InputDecoration(
            hintText: _hint,
            prefixIcon: const Icon(Icons.search_rounded),
          ),
        ),
        const SizedBox(height: 18),
        if (_query.isEmpty) ...[
          const SectionTitle('Попробуйте в демо'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ActionChip(
                label: const Text('ИИН 900312300123'),
                onPressed: () {
                  _setMode(_Mode.iin);
                  _controller.text = '900312300123';
                  _onChanged('900312300123');
                },
              ),
              ActionChip(
                label: const Text('Ахметов'),
                onPressed: () {
                  _setMode(_Mode.name);
                  _controller.text = 'Ахметов';
                  _onChanged('Ахметов');
                },
              ),
              ActionChip(
                label: const Text('Чистый: 950820400987'),
                onPressed: () {
                  _setMode(_Mode.iin);
                  _controller.text = '950820400987';
                  _onChanged('950820400987');
                },
              ),
            ],
          ),
        ] else if (_loading) ...[
          const SkeletonBox(),
          const SizedBox(height: 10),
          const SkeletonBox(),
        ] else if (_tooShort) ...[
          Text(_needMore,
              style: GoogleFonts.manrope(color: AppColors.muted)),
        ] else if (_results.isEmpty) ...[
          AppCard(
            child: Column(
              children: [
                const Icon(Icons.search_off_rounded,
                    size: 40, color: AppColors.hint),
                const SizedBox(height: 8),
                Text('Ничего не найдено',
                    style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w800, color: AppColors.ink)),
                const SizedBox(height: 4),
                Text(
                  'В базе нет записей по этому запросу.',
                  style: GoogleFonts.manrope(color: AppColors.muted),
                ),
              ],
            ),
          ),
        ] else ...[
          const SectionTitle('Результаты поиска'),
          for (final c in _results) ...[
            ClientTile(client: c, onTap: () => openClient(context, c.id)),
            const SizedBox(height: 10),
          ],
        ],
      ],
    );
  }
}
