import 'package:local_auth/local_auth.dart';

class AuthenticationService {
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  Future<bool> isBiometricAvailable() async {
    bool isAvailable = await _localAuthentication.canCheckBiometrics;
    return isAvailable;
  }

  Future<List<BiometricType>> getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics =
        await _localAuthentication.getAvailableBiometrics();
    return availableBiometrics;
  }

  Future<bool> authenticateWithBiometrics() async {
    bool isAuthenticated = false;
    try {
      isAuthenticated = await _localAuthentication.authenticate(
          localizedReason: 'Please authenticate to access this feature',
          options: const AuthenticationOptions(
              useErrorDialogs: true, stickyAuth: true));
    } on Exception catch (e) {
      print(e);
    }
    return isAuthenticated;
  }
}
