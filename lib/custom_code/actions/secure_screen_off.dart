// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:screen_protector/screen_protector.dart';

Future secureScreenOff() async {
  // Включаем защиту конкретно от скриншотов.
  // Эта команда точно существует в пакете.
  await ScreenProtector.preventScreenshotOff();
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
