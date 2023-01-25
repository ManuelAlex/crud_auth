import 'package:crud_auth/const/colour_const.dart';
import 'package:crud_auth/const/styles_const.dart';
import 'package:flutter/material.dart';

class TexteildInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPasswprd;
  final String hintText;
  final TextInputType keyBoardType;
  final String title;

  const TexteildInput({
    super.key,
    required this.textEditingController,
    this.isPasswprd = false,
    this.hintText = '',
    required this.keyBoardType,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder outlineInputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: kTextStyle.copyWith(color: kPrimaryColor),
          ),
          TextField(
            style: const TextStyle(color: kWhite),
            controller: textEditingController,
            decoration: InputDecoration(
              fillColor: kPrimaryColor,
              //iconColor: kScalfoldBackgroundColour,
              hintText: hintText,
              hintStyle: const TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 10,
                  letterSpacing: 1.5),
              border: outlineInputBorder,
              focusedBorder: outlineInputBorder,
              enabledBorder: outlineInputBorder,
              filled: true,
              contentPadding: const EdgeInsets.all(8),
            ),
            keyboardType: keyBoardType,
            obscureText: isPasswprd,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
