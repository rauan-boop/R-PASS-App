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

Future<List<String>> uploadPhotos(
  List<String>? imagePaths,
  String? recordId,
) async {
  if (imagePaths == null ||
      imagePaths.isEmpty ||
      recordId == null ||
      recordId.isEmpty) {
    return [];
  }

  List<String> uploadedUrls = [];
  final String bucketName = 'documents'; // Имя вашей ПУБЛИЧНОЙ корзины

  for (int i = 0; i < imagePaths.length; i++) {
    final localPath = imagePaths[i];

    // --- ИСПРАВЛЕНИЕ ЗДЕСЬ ---
    // Проверяем, что путь к файлу существует, прежде чем его использовать
    if (localPath == null || localPath.isEmpty) {
      continue; // Пропускаем этот файл и переходим к следующему
    }
    // --- КОНЕЦ ИСПРАВЛЕНИЯ ---

    try {
      final fileBytes = await File(localPath).readAsBytes();
      final fileExtension = extension(localPath);
      final String fileName =
          '${DateTime.now().millisecondsSinceEpoch}_$i$fileExtension';
      final String filePath = 'blacklist/$recordId/$fileName';

      await Supabase.instance.client.storage
          .from(bucketName)
          .uploadBinary(filePath, fileBytes);

      final String publicUrl = Supabase.instance.client.storage
          .from(bucketName)
          .getPublicUrl(filePath);

      uploadedUrls.add(publicUrl);
    } catch (e) {
      print('Ошибка при загрузке файла $localPath: $e');
    }
  }
  return uploadedUrls;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
