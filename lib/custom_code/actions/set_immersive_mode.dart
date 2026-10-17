// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';

Future setImmersiveMode() async {
  // Эта строка включает режим "от края до края",
  // делая системные панели (верхнюю и нижнюю) прозрачными.
  // Это самый популярный и современный вариант.
  //  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  // Если вы хотите ПОЛНОСТЬЮ СКРЫТЬ панель, используйте этот код вместо верхнего:
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
