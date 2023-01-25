import 'package:crud_auth/auth_services/services_auth.dart';
import 'package:crud_auth/const/colour_const.dart';
import 'package:crud_auth/const/styles_const.dart';
import 'package:crud_auth/screens/profile_screen.dart';
import 'package:crud_auth/tools/snackbar.dart';
import 'package:crud_auth/widgets/text_feild_input.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // final AuthMethod authMethod = AuthMethod();

  late final TextEditingController emailTextEditingCtrl;
  late final TextEditingController passwordTextEditingCtrl;
  bool _isLoading = false;

  @override
  void initState() {
    emailTextEditingCtrl = TextEditingController();
    passwordTextEditingCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailTextEditingCtrl.dispose();
    passwordTextEditingCtrl.dispose();
    super.dispose();
  }

  login() async {
    setState(() {
      _isLoading = true;
    });
    String res = await ApiServicesAuth().loginUser(
      email: emailTextEditingCtrl.text.trim(),
      password: passwordTextEditingCtrl.text.trim(),
    );
    if (res == 'success') {
      // ignore: use_build_context_synchronously
      print(res);
      showSnackBar(context, res);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const UserProfile()));
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              //name
              Text(
                'Penge Send',
                style: kTextStyle.copyWith(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 60,
              ),
              //container wrapper
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: kIntermediateColour,
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TexteildInput(
                        title: 'Email',
                        hintText: 'please enter you Email',
                        textEditingController: emailTextEditingCtrl,
                        keyBoardType: TextInputType.emailAddress,
                      ),
                      TexteildInput(
                        title: 'Password',
                        hintText: 'please enter you password',
                        textEditingController: passwordTextEditingCtrl,
                        keyBoardType: TextInputType.visiblePassword,
                        isPasswprd: true,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  login();
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                      color: kIntermediateColour,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset:
                              const Offset(1, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: const BorderRadius.all(Radius.circular(4))),
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          color: kPrimaryColor,
                        )
                      : Text(
                          'Register',
                          style: kTextStyle.copyWith(color: kPrimaryColor),
                        ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text('Already have an account ?'),
                  ),
                  GestureDetector(
                    onTap: (() {
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const Login()));
                    }),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        ' Login Here',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
