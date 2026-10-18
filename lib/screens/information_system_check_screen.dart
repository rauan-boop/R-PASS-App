import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_colors.dart';
import '../widgets/common.dart';

class InformationSystemCheckScreen extends StatefulWidget {
  const InformationSystemCheckScreen({super.key});

  @override
  State<InformationSystemCheckScreen> createState() =>
      _InformationSystemCheckScreenState();
}

class _InformationSystemCheckScreenState
    extends State<InformationSystemCheckScreen> {
  static const _informationSystems = [
    'База данных R-PASS',
    'Комитет государственных доходов МФ РК',
    'АИС ОИП МЮ РК',
  ];

  final _iinController = TextEditingController();
  final Set<String> _selectedSystems = {};
  bool _showDemoRecognition = false;

  @override
  void dispose() {
    _iinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72,
        automaticallyImplyLeading: false,
        leading: const SizedBox(width: 56),
        leadingWidth: 56,
        title: Text(
          'Проверка по информационным системам',
          textAlign: TextAlign.center,
          maxLines: 2,
          style: GoogleFonts.manrope(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: AppColors.ink,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Назад',
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_rounded),
          ),
        ],
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.ink,
        elevation: 0,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _iinController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(12),
                      ],
                      onChanged: (_) {
                        if (_showDemoRecognition) {
                          setState(() => _showDemoRecognition = false);
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: 'ИИН',
                        hintText: 'Введите 12 цифр ИИН',
                        prefixIcon: Icon(Icons.edit_outlined),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton.filledTonal(
                    tooltip: 'Сканировать ИИН',
                    onPressed: () =>
                        setState(() => _showDemoRecognition = true),
                    icon: const Icon(Icons.photo_camera_outlined),
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.surface,
                      foregroundColor: AppColors.primary,
                      side: const BorderSide(color: AppColors.border),
                      minimumSize: const Size(56, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const SectionTitle('Выберите системы для проверки'),
              AppCard(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  children: [
                    for (var i = 0; i < _informationSystems.length; i++)
                      CheckboxListTile(
                        value:
                            _selectedSystems.contains(_informationSystems[i]),
                        onChanged: (checked) {
                          setState(() {
                            if (checked == true) {
                              _selectedSystems.add(_informationSystems[i]);
                            } else {
                              _selectedSystems.remove(_informationSystems[i]);
                            }
                          });
                        },
                        title: Text(
                          _informationSystems[i],
                          style: GoogleFonts.manrope(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.ink,
                          ),
                        ),
                        activeColor: AppColors.primary,
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12),
                        dense: true,
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Проверка по информационным системам появится позже',
                      ),
                    ),
                  ),
                  child: const Text('Проверить'),
                ),
              ),
              if (_showDemoRecognition) ...[
                const SizedBox(height: 20),
                const SectionTitle('Результат распознавания'),
                AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Pill(
                        text: 'Демонстрационный результат',
                        color: AppColors.primary,
                      ),
                      const SizedBox(height: 14),
                      _RecognizedField(
                        label: 'ФИО',
                        value: 'Смирнов Иван Петрович',
                      ),
                      const SizedBox(height: 12),
                      _RecognizedField(
                        label: 'ИИН',
                        value: '900312300123',
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Распознавание камерой и получение данных от ИИ-агента '
                        'будут добавлены позже.',
                        style: GoogleFonts.manrope(
                          fontSize: 12,
                          color: AppColors.muted,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _RecognizedField extends StatelessWidget {
  const _RecognizedField({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.manrope(
            fontSize: 12,
            color: AppColors.muted,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: GoogleFonts.manrope(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppColors.ink,
          ),
        ),
      ],
    );
  }
}
