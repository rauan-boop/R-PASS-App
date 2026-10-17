import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/brand/brand_widgets.dart';
import '../config/app_colors.dart';
import '../widgets/common.dart';
import 'shell_screen.dart';
import 'sms_screen.dart';

/// Formats digits as "(777) 123-45-67".
class _PhoneFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    final d = digits.length > 10 ? digits.substring(0, 10) : digits;
    final b = StringBuffer();
    for (var i = 0; i < d.length; i++) {
      if (i == 0) b.write('(');
      if (i == 3) b.write(') ');
      if (i == 6 || i == 8) b.write('-');
      b.write(d[i]);
    }
    final text = b.toString();
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phone = TextEditingController();

  bool get _valid => _phone.text.replaceAll(RegExp(r'\D'), '').length == 10;

  @override
  void dispose() {
    _phone.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_valid) return;
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => SmsScreen(phone: _phone.text)),
    );
  }

  void _demoLogin() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const ShellScreen()),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const RPassBrand(logoSize: 112, fontSize: 36),
                  const SizedBox(height: 28),
                  AppCard(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextField(
                          controller: _phone,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [_PhoneFormatter()],
                          onChanged: (_) => setState(() {}),
                          onSubmitted: (_) => _submit(),
                          decoration: const InputDecoration(
                            labelText: 'Номер телефона',
                            prefixText: '+7 ',
                            prefixIcon: Icon(Icons.phone_outlined),
                          ),
                        ),
                        const SizedBox(height: 20),
                        FilledButton(
                          onPressed: _valid ? _submit : null,
                          child: const Text('Получить код'),
                        ),
                        const SizedBox(height: 12),
                        OutlinedButton.icon(
                          onPressed: _demoLogin,
                          icon: const Icon(Icons.bolt_rounded),
                          label: const Text('Тестовый вход'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
