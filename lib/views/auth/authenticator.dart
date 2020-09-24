
class LocalAuthenticator {
  static LocalAuthenticator _instance;
  static LocalAuthenticator getInstance() {
    if(_instance == null) _instance = LocalAuthenticator._internal();
    return _instance;
  }
  LocalAuthenticator._internal();
}