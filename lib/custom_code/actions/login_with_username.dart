// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:supabase_flutter/supabase_flutter.dart';

Future<bool> loginWithUsername(
  String username,
  String password,
) async {
  // Этот код будет выполнен при вызове действия
  String? userEmail; // Используем String? для null safety

  // 1. Определяем, email это или username
  if (username.contains('@')) {
    userEmail = username;
  } else {
    // Если это username, вызываем нашу SQL-функцию
    try {
      final response = await Supabase.instance.client.rpc(
        'get_email_by_username',
        params: {'p_username': username},
      );
      if (response != null && response.toString().isNotEmpty) {
        userEmail = response.toString();
      }
    } catch (e) {
      print('Error getting email by username: $e');
      return false; // Ошибка при поиске email
    }
  }

  // 2. Если email не найден, выходим с ошибкой
  if (userEmail == null || userEmail.isEmpty) {
    return false;
  }

  // 3. Если email найден, пытаемся войти
  try {
    final response = await Supabase.instance.client.auth.signInWithPassword(
      email: userEmail,
      password: password,
    );
    // Если есть пользователь в ответе и нет ошибки - вход успешен
    if (response.user != null) {
      return true;
    }
  } catch (e) {
    print('Error during sign in: $e');
    return false; // Ошибка при входе
  }

  // Если ни одно из условий не сработало, возвращаем false
  return false;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
