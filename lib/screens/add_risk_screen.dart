import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_colors.dart';
import '../data/demo_store.dart';
import '../widgets/common.dart';

class AddRiskScreen extends StatefulWidget {
  const AddRiskScreen({super.key});

  @override
  State<AddRiskScreen> createState() => _AddRiskScreenState();
}

class _AddRiskScreenState extends State<AddRiskScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _iin = TextEditingController();
  final _desc = TextEditingController();
  Category? _category;
  Severity _severity = Severity.medium;
  int _photos = 0;
  bool _confirmed = false;
  bool _triedSubmit = false;

  @override
  void dispose() {
    _name.dispose();
    _iin.dispose();
    _desc.dispose();
    super.dispose();
  }

  void _submit() {
    setState(() => _triedSubmit = true);
    if (!_formKey.currentState!.validate() ||
        _category == null ||
        !_confirmed) {
      return;
    }
    DemoStore.instance.addIncident(
      fullName: _name.text.trim(),
      iin: _iin.text.trim(),
      category: _category!,
      severity: _severity,
      description: _desc.text.trim(),
      photos: _photos,
    );
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Запись отправлена на модерацию')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить нарушителя'),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.ink,
        elevation: 0,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 40),
              children: [
                TextFormField(
                  controller: _name,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                      labelText: 'ФИО *',
                      hintText: 'Иванов Иван Иванович'),
                  validator: (v) => (v == null || v.trim().split(' ').length < 2)
                      ? 'Введите фамилию и имя'
                      : null,
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _iin,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(12),
                  ],
                  decoration: const InputDecoration(labelText: 'ИИН *'),
                  validator: (v) =>
                      (v == null || v.length != 12) ? 'ИИН — 12 цифр' : null,
                ),
                const SectionTitle('Категория *'),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final c in Category.values)
                      ChoiceChip(
                        label: Text(c.label),
                        selected: _category == c,
                        onSelected: (_) => setState(() => _category = c),
                      ),
                  ],
                ),
                if (_triedSubmit && _category == null)
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text('Выберите категорию',
                        style: GoogleFonts.manrope(
                            fontSize: 12, color: AppColors.error)),
                  ),
                const SectionTitle('Степень риска *'),
                SegmentedButton<Severity>(
                  showSelectedIcon: false,
                  segments: [
                    for (final s in Severity.values)
                      ButtonSegment(value: s, label: Text(s.label)),
                  ],
                  selected: {_severity},
                  onSelectionChanged: (s) =>
                      setState(() => _severity = s.first),
                  style: SegmentedButton.styleFrom(
                    selectedBackgroundColor:
                        _severity.color.withOpacity(0.15),
                    selectedForegroundColor: AppColors.ink,
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _desc,
                  maxLines: 4,
                  decoration: const InputDecoration(
                      labelText: 'Описание *',
                      alignLabelWithHint: true),
                  validator: (v) => (v == null || v.trim().length < 10)
                      ? 'Опишите ситуацию (от 10 символов)'
                      : null,
                ),
                const SectionTitle('Доказательства'),
                AppCard(
                  onTap: () => setState(
                      () => _photos = _photos >= 5 ? 5 : _photos + 1),
                  child: Row(
                    children: [
                      const Icon(Icons.photo_camera_outlined,
                          color: AppColors.primary),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _photos == 0
                              ? 'Загрузить фото (до 5)'
                              : 'Фото: $_photos из 5 (демо)',
                          style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w700,
                              color: AppColors.ink),
                        ),
                      ),
                      if (_photos > 0)
                        IconButton(
                          onPressed: () => setState(() => _photos = 0),
                          icon: const Icon(Icons.close_rounded),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'На фото автоматически добавляется водяной знак: дата и название компании.',
                  style: GoogleFonts.manrope(
                      fontSize: 12, color: AppColors.hint),
                ),
                const SizedBox(height: 14),
                CheckboxListTile(
                  value: _confirmed,
                  onChanged: (v) => setState(() => _confirmed = v ?? false),
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  activeColor: AppColors.primary,
                  title: Text(
                    'Подтверждаю достоверность данных и наличие согласия клиента',
                    style: GoogleFonts.manrope(fontSize: 13),
                  ),
                ),
                if (_triedSubmit && !_confirmed)
                  Text('Необходимо подтверждение',
                      style: GoogleFonts.manrope(
                          fontSize: 12, color: AppColors.error)),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: _submit,
                  child: const Text('Отправить на модерацию'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
