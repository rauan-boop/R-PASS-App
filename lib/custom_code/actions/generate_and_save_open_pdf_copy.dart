// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/config/app_config.dart';
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
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:typed_data';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:http/http.dart' as http;

// Функция для генерации и предпросмотра PDF с логотипом и водяным знаком
Future<bool> generateAndSaveOpenPdfCopy(
  // Ваши аргументы
  String agreementText,
  String surname,
  String name,
  String patronymic,
  String iin,
  String fileName,
  String pfone,
  String ipAddress,
  String deviceModel,
) async {
  if (AppConfig.demoMode) return true;
  try {
    debugPrint("Шаг 1: Проверка аутентификации пользователя.");
    final userId = Supabase.instance.client.auth.currentUser?.id;
    if (userId == null) {
      debugPrint("Ошибка: Пользователь не аутентифицирован.");
      return false;
    }
    debugPrint("Пользователь аутентифицирован: $userId");

    // --- ЗАГРУЗКА ЛОГОТИПА ---
    debugPrint("Шаг 2: Загрузка логотипа из Supabase.");
    // <-- ССЫЛКА НА ЛОГОТИП ВСТАВЛЕНА --
    final logoUrl = '${AppConfig.publicAssetsUrl}/image/1759953509259000.png';

    final pw.MemoryImage logoImage;
    try {
      final logoResponse = await http
          .get(Uri.parse(logoUrl))
          .timeout(const Duration(seconds: 15));
      if (logoResponse.statusCode != 200) {
        throw Exception(
            'Не удалось загрузить логотип. Статус код: ${logoResponse.statusCode}');
      }
      logoImage = pw.MemoryImage(logoResponse.bodyBytes);
      debugPrint("Логотип успешно загружен.");
    } catch (e) {
      debugPrint("---!!! КРИТИЧЕСКАЯ ОШИБКА ЗАГРУЗКИ ЛОГОТИПА !!!---");
      debugPrint("Проверьте URL-адрес и доступность файла. Ошибка: $e");
      return false;
    }
    // -------------------------

    debugPrint("Шаг 3: Загрузка шрифтов.");
    final font = await PdfGoogleFonts.montserratRegular();
    final boldFont = await PdfGoogleFonts.montserratBold();
    debugPrint("Шрифты успешно загружены.");

    debugPrint("Шаг 4: Форматирование текста соглашения.");
    final now = DateTime.now();
    final formatter = DateFormat('dd.MM.yyyy HH:mm:ss');
    final formattedDate = formatter.format(now);

    String formattedAgreement = agreementText
        .replaceAll('[USER_SURNAME]', surname)
        .replaceAll('[USER_NAME]', name)
        .replaceAll('[USER_OTCHESTVO]', patronymic)
        .replaceAll('[USER_IIN]', iin)
        .replaceAll('[USER_PFONE]', pfone)
        .replaceAll('[DATE]', formattedDate);

    debugPrint("Шаг 5: Создание PDF-документа.");
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        // ИЗМЕНЕНО: pageFormat перенесен внутрь pageTheme
        pageTheme: pw.PageTheme(
          pageFormat: PdfPageFormat.a4, // <--- ПЕРЕМЕЩЕНО СЮДА
          margin: const pw.EdgeInsets.fromLTRB(
              2 * PdfPageFormat.cm, // Левое поле 2 см
              1.5 * PdfPageFormat.cm, // Верхнее поле 1.5 см
              1.5 * PdfPageFormat.cm, // Правое поле 1.5 см
              1.5 * PdfPageFormat.cm // Нижнее поле 1.5 см
              ),
          buildBackground: (pw.Context context) {
            return pw.Center(
              child: pw.Opacity(
                opacity: 0.1, // Бледность водяного знака
                child: pw.Image(logoImage, height: 400),
              ),
            );
          },
        ),
        header: (pw.Context context) {
          return pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Image(logoImage, height: 60),
              pw.Container(), // Пустой контейнер для выравнивания
            ],
          );
        },
        build: (pw.Context context) => [
          pw.Center(
            child: pw.Text(
              'Пользовательское соглашение',
              style: pw.TextStyle(font: boldFont, fontSize: 20),
              textAlign: pw.TextAlign.center,
            ),
          ),
          pw.SizedBox(height: 30),
          pw.Paragraph(
            text: formattedAgreement,
            style: pw.TextStyle(font: font, fontSize: 12),
          ),
        ],
        footer: (pw.Context context) {
          return pw.Align(
            alignment: pw.Alignment.bottomRight,
            child: pw.Container(
              width: 250,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'Документ подписан:',
                    style: pw.TextStyle(font: boldFont, color: PdfColors.grey),
                  ),
                  pw.Divider(color: PdfColors.grey),
                  pw.SizedBox(height: 5),
                  pw.Text('ФИО: $surname $name',
                      style: pw.TextStyle(font: font, fontSize: 9)),
                  pw.Text('тел: $pfone',
                      style: pw.TextStyle(font: font, fontSize: 9)),
                  pw.Text('Устройство: $deviceModel',
                      style: pw.TextStyle(font: font, fontSize: 9)),
                  pw.Text('IP-адрес: $ipAddress',
                      style: pw.TextStyle(font: font, fontSize: 9)),
                  pw.Text('Дата и время: $formattedDate',
                      style: pw.TextStyle(font: font, fontSize: 9)),
                ],
              ),
            ),
          );
        },
      ),
    );
    debugPrint("PDF-документ успешно сформирован.");

    debugPrint("Шаг 6: Отображение PDF для предпросмотра.");
    final Uint8List pdfBytes = await pdf.save();

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdfBytes,
    );

    debugPrint("PDF успешно отображен.");
    return true;
  } catch (e, stackTrace) {
    debugPrint("Произошла критическая ошибка: $e");
    debugPrint("Стек вызовов: $stackTrace");
    return false;
  }
}
