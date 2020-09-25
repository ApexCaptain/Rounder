
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthenticator {
  static LocalAuthenticator _instance;
  static LocalAuthenticator getInstance() {
    if(_instance == null) _instance = LocalAuthenticator._internal();
    return _instance;
  }
  LocalAuthenticator._internal();

  final LocalAuthentication _auth = LocalAuthentication();
  var _isAuthenticating = false;
  get isAuthenticating => _isAuthenticating;

  Future<bool> isAvailable() async {
    bool isAvailable = false;
    try {
      isAvailable = await _auth.canCheckBiometrics;
    } on PlatformException catch (_) {
      isAvailable = false;
    }
    return isAvailable;
  }

  Future<bool> authenticate() async {
    bool isAuthenticated = false;
    _isAuthenticating = true;
    try {
      isAuthenticated = await _auth.authenticateWithBiometrics(
        localizedReason: "생체",
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } on PlatformException catch(_) {
      isAuthenticated = false;
    }
    _isAuthenticating = false;
    return isAuthenticated;
  }

}