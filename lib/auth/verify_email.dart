import 'dart:async';

import 'package:crud_auth/const/colour_const.dart';
import 'package:crud_auth/screens/profile_screen.dart';
import 'package:crud_auth/tools/snackbar.dart';
import 'package:crud_auth/widgets/button.dart';
import 'package:crud_auth/widgets/text_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;

  Future<void> checkEmailVerified() async {}

  void sendVerificationEmail() async {}

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const TextWidget(title: 'Verify Email'),
        ),
        body: isEmailVerified
            ? const UserProfile()
            : Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextWidget(
                      title: 'A verification has been sent to your email',
                      fontsize: 18,
                    ),
                    const SizedBox(height: 100),
                    InkWell(
                      onTap: (() {
                        //canResendEmail ? sendVerificationEmail() : () {};
                      }),
                      child: Button(
                        title: 'Resend Email',
                        hasIcon: true,
                        color: kIntermediateColour,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: TextButton(
                          onPressed: (() {}),
                          child: const TextWidget(
                            title: 'Cancel',
                            color: kWhite,
                          )),
                    )
                  ],
                ),
              ),
      );
}
