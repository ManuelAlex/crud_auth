import 'package:crud_auth/auth/login.dart';
import 'package:crud_auth/auth_services/services_auth.dart';
import 'package:crud_auth/const/colour_const.dart';
import 'package:crud_auth/const/styles_const.dart';
import 'package:crud_auth/screens/profile_screen.dart';
import 'package:crud_auth/tools/snackbar.dart';
import 'package:crud_auth/widgets/text_feild_input.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late final TextEditingController fIrstnameTextEditingCtrl;
  late final TextEditingController lastnameTextEditingCtrl;
  late final TextEditingController emailTextEditingCtrl;
  late final TextEditingController passwordTextEditingCtrl;
  late final TextEditingController phoneTextEditingCtrl;
  bool _isLoading = false;

  @override
  void initState() {
    lastnameTextEditingCtrl = TextEditingController();
    fIrstnameTextEditingCtrl = TextEditingController();
    emailTextEditingCtrl = TextEditingController();
    passwordTextEditingCtrl = TextEditingController();
    phoneTextEditingCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    lastnameTextEditingCtrl.dispose();
    phoneTextEditingCtrl.dispose();
    fIrstnameTextEditingCtrl.dispose();
    emailTextEditingCtrl.dispose();
    passwordTextEditingCtrl.dispose();
    super.dispose();
  }

  void registerUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await ApiServicesAuth().createUser(
        firstName: fIrstnameTextEditingCtrl.text.trim(),
        lastName: lastnameTextEditingCtrl.text.trim(),
        email: emailTextEditingCtrl.text.trim(),
        password: passwordTextEditingCtrl.text.trim(),
        phone: phoneTextEditingCtrl.text.trim());
    if (res == 'success') {
      print(res);
      showSnackBar(context, res);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const UserProfile()));
    }
    setState(() {
      _isLoading = false;
    });
  }

  Login() async {
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
                        title: 'First Name',
                        hintText: 'please enter you first name',
                        textEditingController: fIrstnameTextEditingCtrl,
                        keyBoardType: TextInputType.name,
                      ),
                      TexteildInput(
                        title: 'last Name',
                        hintText: 'please enter you last name',
                        textEditingController: lastnameTextEditingCtrl,
                        keyBoardType: TextInputType.name,
                      ),
                      TexteildInput(
                        title: 'Email',
                        hintText: 'please enter you Email',
                        textEditingController: emailTextEditingCtrl,
                        keyBoardType: TextInputType.emailAddress,
                      ),
                      TexteildInput(
                        title: 'phone number',
                        hintText: 'please enter you phone',
                        textEditingController: phoneTextEditingCtrl,
                        keyBoardType: TextInputType.number,
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
                onTap: () async {
                  registerUser();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserProfile()));
                },
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : Container(
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
                                offset: const Offset(
                                    1, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4))),
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                color: kPrimaryColor,
                              )
                            : Text(
                                'Register',
                                style:
                                    kTextStyle.copyWith(color: kPrimaryColor),
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
