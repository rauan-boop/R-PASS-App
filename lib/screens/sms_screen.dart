import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_colors.dart';
import '../widgets/common.dart';
import 'shell_screen.dart';

class SmsScreen extends StatefulWidget {
  const SmsScreen({super.key, required this.phone});

  final String phone;

  @override
  State<SmsScreen> createState() => _SmsScreenState();
}

class _SmsScreenState extends State<SmsScreen> {
  final _code = TextEditingController();
  Timer? _timer;
  int _left = 45;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_left == 0) {
        t.cancel();
      } else {
        setState(() => _left--);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _code.dispose();
    super.dispose();
  }

  void _confirm() {
    if (_code.text.length != 4) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const ShellScreen()),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final digits = widget.phone.replaceAll(RegExp(r'\D'), '');
    final masked = digits.length == 10
        ? '+7 ${digits.substring(0, 3)} *** ${digits.substring(6, 8)} ${digits.substring(8)}'
        : widget.phone;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.ink,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: AppCard(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Введите код из SMS',
                      style: GoogleFonts.manrope(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: AppColors.ink,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Отправлен на $masked',
                      style: GoogleFonts.manrope(
                          fontSize: 14, color: AppColors.muted),
                    ),
                    const SizedBox(height: 22),
                    TextField(
                      controller: _code,
                      autofocus: true,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),
                      ],
                      onChanged: (_) => setState(() {}),
                      onSubmitted: (_) => _confirm(),
                      style: GoogleFonts.manrope(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 18,
                        color: AppColors.ink,
                      ),
                      decoration: const InputDecoration(hintText: '····'),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Text(
                        _left > 0
                            ? 'Отправить повторно (00:${_left.toString().padLeft(2, '0')})'
                            : 'Отправить код повторно',
                        style: GoogleFonts.manrope(
                            fontSize: 13, color: AppColors.muted),
                      ),
                    ),
                    const SizedBox(height: 20),
                    FilledButton(
                      onPressed: _code.text.length == 4 ? _confirm : null,
                      child: const Text('Подтвердить'),
                    ),
                    const SizedBox(height: 14),
                    Center(
                      child: Text(
                        'Демо-режим: подойдёт любой 4-значный код',
                        style: GoogleFonts.manrope(
                            fontSize: 12, color: AppColors.hint),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
