import 'package:flutter/material.dart';

class DottedAddContainer extends StatelessWidget {
  final Widget iconOrImage;
  final Color color;
  final BoxDecoration boxDecoration;
  final double paddingValue;

  final String myText;

  const DottedAddContainer(
      {super.key,
      required this.iconOrImage,
      required this.boxDecoration,
      required this.color,
      required this.myText,
      this.paddingValue = 8});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: kThemeChangeDuration,
            decoration: boxDecoration,
            child: Padding(
              padding: EdgeInsets.all(paddingValue),
              child: iconOrImage,
              // child: Icon(
              //   iconData,
              //   color: color,
              // ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              myText,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
