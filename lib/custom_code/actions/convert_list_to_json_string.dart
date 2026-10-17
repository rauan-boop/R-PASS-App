// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

dynamic convertListToJsonString(List<String>? urlList) {
  // Эта функция берет список строк и возвращает его как JSON.
  if (urlList == null || urlList.isEmpty) {
    // Возвращаем пустой JSON-массив
    return jsonDecode('[]');
  }
  // Упаковываем список в JSON-строку, а затем декодируем обратно в JSON-объект
  return jsonDecode(jsonEncode(urlList));
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
