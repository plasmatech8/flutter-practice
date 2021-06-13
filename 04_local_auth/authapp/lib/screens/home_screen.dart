import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class HomePage extends StatelessWidget {
  final LocalAuthentication auth = LocalAuthentication();

  void authenticate(context) async {
    print('Authentication started...');

    // Check biometrics
    if (kIsWeb) return print('Cannot check biometrics on this device');
    bool canCheckBiometrics = await auth.canCheckBiometrics;
    if (!canCheckBiometrics) return print('Cannot check biometrics on this device');

    // Get available biometrics
    List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();
    print(availableBiometrics);

    // Authenticate
    bool authenticated = await auth.authenticate(localizedReason: 'Authenticate for something');
    print(authenticated);

    // Do stuff
    if (authenticated) {
      Navigator.pushNamed(context, '/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('asdasdas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Press this button to authenticate:',
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              child: Text('Authenticate'),
              onPressed: () => authenticate(context),
            ),
          ],
        ),
      ),
    );
  }
}
