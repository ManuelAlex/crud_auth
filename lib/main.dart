import 'package:crud_auth/auth/login.dart';
import 'package:crud_auth/auth/register_screen.dart';
import 'package:crud_auth/auth/verify_email.dart';
import 'package:crud_auth/const/colour_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  runApp(const PengeSend());
}

class PengeSend extends StatelessWidget {
  const PengeSend({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Crud Auth',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
        ),
        home: Register());
  }
}
