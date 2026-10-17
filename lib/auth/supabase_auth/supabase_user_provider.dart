import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '/backend/supabase/supabase.dart';
import '/config/app_config.dart';
import '/config/demo_data.dart';
import '../base_auth_user_provider.dart';

export '../base_auth_user_provider.dart';

class RPassSupabaseUser extends BaseAuthUser {
  RPassSupabaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;

  @override
  AuthUserInfo get authUserInfo => AuthUserInfo(
        uid: user?.id,
        email: user?.email,
        phoneNumber: user?.phone,
      );

  @override
  Future? delete() =>
      throw UnsupportedError('The delete user operation is not yet supported.');

  @override
  Future? updateEmail(String email) async {
    if (AppConfig.demoMode) return;
    final response =
        await SupaFlow.client.auth.updateUser(UserAttributes(email: email));
    if (response.user != null) {
      user = response.user;
    }
  }

  @override
  Future? updatePassword(String newPassword) async {
    if (AppConfig.demoMode) return;
    final response = await SupaFlow.client.auth.updateUser(
      UserAttributes(password: newPassword),
    );
    if (response.user != null) {
      user = response.user;
    }
  }

  @override
  Future? sendEmailVerification() => throw UnsupportedError(
      'The send email verification operation is not yet supported.');

  @override
  bool get emailVerified {
    // Reloads the user when checking in order to get the most up to date
    // email verified status.
    if (loggedIn && user!.emailConfirmedAt == null) {
      refreshUser();
    }
    return user?.emailConfirmedAt != null;
  }

  @override
  Future refreshUser() async {
    if (AppConfig.demoMode) return;
    await SupaFlow.client.auth
        .refreshSession()
        .then((_) => user = SupaFlow.client.auth.currentUser);
  }
}

final _demoAuthController = StreamController<BaseAuthUser>.broadcast();

User _demoUser() => User(
      id: DemoData.userId,
      appMetadata: const {},
      userMetadata: const {},
      aud: 'authenticated',
      createdAt: DateTime.now().toIso8601String(),
      email: DemoData.userEmail,
      emailConfirmedAt: DateTime.now().toIso8601String(),
    );

void demoSignIn() {
  currentUser = RPassSupabaseUser(_demoUser());
  _demoAuthController.add(currentUser!);
}

void demoSignOut() {
  currentUser = RPassSupabaseUser(null);
  _demoAuthController.add(currentUser!);
}

Stream<BaseAuthUser> _demoUserStream() async* {
  currentUser = RPassSupabaseUser(null);
  yield currentUser!;
  yield* _demoAuthController.stream;
}

/// Generates a stream of the authenticated user.
/// [SupaFlow.client.auth.onAuthStateChange] does not yield any values until the
/// user is already authenticated. So we add a default null user to the stream,
/// if we need to interact with the [currentUser] before logging in.
Stream<BaseAuthUser> rPassSupabaseUserStream() {
  if (AppConfig.demoMode) return _demoUserStream();
  final supabaseAuthStream = SupaFlow.client.auth.onAuthStateChange.debounce(
      (authState) => authState.event == AuthChangeEvent.tokenRefreshed
          ? TimerStream(authState, Duration(seconds: 1))
          : Stream.value(authState));
  return (!loggedIn
          ? Stream<AuthState?>.value(null).concatWith([supabaseAuthStream])
          : supabaseAuthStream)
      .map<BaseAuthUser>(
    (authState) {
      currentUser = RPassSupabaseUser(authState?.session?.user);
      return currentUser!;
    },
  );
}
