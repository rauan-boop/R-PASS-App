// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:path/path.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'dart:io';
import 'package:path/path.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '/config/app_config.dart';

Future<List<String>> uploadImagePaths(
  List<String>? imagePaths,
  String? recordId,
) async {
  if (AppConfig.demoMode) return [];

  // --- ОТЛАДОЧНЫЕ СООБЩЕНИЯ ---
  print('--- ЗАПУСК ФУНКЦИИ uploadImagePaths ---');
  print('Получен recordId: ${recordId ?? "null"}');
  print('Получено файлов (путей): ${imagePaths?.length ?? 0}');
  // --- КОНЕЦ ОТЛАДКИ ---

  if (imagePaths == null ||
      imagePaths.isEmpty ||
      recordId == null ||
      recordId.isEmpty) {
    print('Условие выхода сработало. Возвращаю пустой список.');
    return [];
  }

  List<String> uploadedUrls = [];
  final String bucketName = 'documents'; // Имя вашей ПУБЛИЧНОЙ корзины

  for (int i = 0; i < imagePaths.length; i++) {
    final localPath = imagePaths[i];
    print('Обрабатываю файл №${i + 1}: $localPath');

    try {
      final fileBytes = await File(localPath).readAsBytes();
      print('  - Файл успешно прочитан (${fileBytes.length} байт).');

      final fileExtension = extension(localPath);
      final String fileName =
          '${DateTime.now().millisecondsSinceEpoch}_$i$fileExtension';
      final String filePath = 'blacklist/$recordId/$fileName';
      print('  - Пытаюсь загрузить в Supabase по пути: $filePath');

      await Supabase.instance.client.storage
          .from(bucketName)
          .uploadBinary(filePath, fileBytes);
      print('  - Файл успешно загружен.');

      final String publicUrl = Supabase.instance.client.storage
          .from(bucketName)
          .getPublicUrl(filePath);
      print('  - Получена публичная ссылка: $publicUrl');

      uploadedUrls.add(publicUrl);
    } catch (e) {
      print('!!! ОШИБКА при обработке файла $localPath: $e');
    }
  }

  print('--- ЗАВЕРШЕНИЕ ФУНКЦИИ. Возвращаю ${uploadedUrls.length} ссылок. ---');
  return uploadedUrls;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
