import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

dynamic strListToDynamic(List<String> items) {
  return List<dynamic>.from(items ?? []);
}

DateTime addOneMonthToCurrentDate() {
  // Эта функция корректно добавляет 1 месяц к текущей дате
  final now = DateTime.now();
  // Создаем новую дату: тот же год, следующий месяц, тот же день
  return DateTime(now.year, now.month + 1, now.day);
}

List<String> passImageList(List<String>? imageList) {
  return imageList ?? [];
}

dynamic convertStringListToJson(List<String>? urlList) {
  if (urlList == null || urlList.isEmpty) {
    return jsonDecode('[]');
  }
  return jsonDecode(jsonEncode(urlList));
}

List<String> toStringList(dynamic jsonData) {
  if (jsonData == null || jsonData is! List) {
    return [];
  }

  // Превращаем список "универсальных" элементов в список строк.
  // Метод .from() безопасно обрабатывает каждый элемент.
  return List<String>.from(jsonData);
}

DateTime getYesterdayDate() {
  // Берем текущую дату и время
  final now = DateTime.now();
  // Вычитаем из нее 24 часа (одни сутки)
  return now.subtract(Duration(days: 1));
}
