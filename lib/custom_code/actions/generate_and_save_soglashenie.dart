// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<String?> generateAndSaveSoglashenie(
  String agreementText,
  String surname,
  String name,
  String patronymic,
  String iin,
  String fileName,
  String pfone,
) async {
  // 1. Проверяем, что пользователь аутентифицирован
  final userId = Supabase.instance.client.auth.currentUser?.id;
  if (userId == null) {
    print('Ошибка: Пользователь не аутентифицирован.');
    return null; // Выходим, если нет ID пользователя
  }

  // 2. Генерируем PDF
  final now = DateTime.now();
  final formatter = DateFormat('dd.MM.yyyy HH:mm:ss');
  final formattedDate = formatter.format(now);

  String formattedAgreement = agreementText
      .replaceAll('[USER_SURNAME]', surname)
      .replaceAll('[USER_NAME]', name)
      .replaceAll('[USER_OTCHESTVO]', patronymic)
      .replaceAll('[USER_IIN]', iin)
      .replaceAll('[DATE]', formattedDate)
      .replaceAll('[USER_PHONE]', pfone);

  final pdf = pw.Document();
  final font = await PdfGoogleFonts.montserratRegular();
  final boldFont = await PdfGoogleFonts.montserratBold();

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) => [
        pw.Center(
          child: pw.Text(
            'Пользовательское соглашение',
            style: pw.TextStyle(font: boldFont, fontSize: 24),
          ),
        ),
        pw.SizedBox(height: 30),
        pw.Paragraph(
          text: formattedAgreement,
          style: pw.TextStyle(font: font, fontSize: 12),
        ),
      ],
    ),
  );

  // 3. Загружаем PDF в Supabase Storage
  try {
    final Uint8List pdfBytes = await pdf.save();
    final String filePath = '$userId/$fileName.pdf';

    await Supabase.instance.client.storage
        .from('signed-documents') // <-- Убедитесь, что имя корзины правильное
        .uploadBinary(
          filePath,
          pdfBytes,
          fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
        );

    // 4. Возвращаем путь к файлу для следующего действия
    return filePath;
  } catch (e) {
    print('Ошибка при загрузке PDF в Supabase: $e');
    return null;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
