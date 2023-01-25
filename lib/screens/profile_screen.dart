import 'package:crud_auth/const/colour_const.dart';
import 'package:crud_auth/widgets/icon_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});
  final bool _isLoaded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SafeArea(
            child: DottedAddContainer(
          boxDecoration: BoxDecoration(
            color: kSecondaryColour,
            shape: BoxShape.circle,
          ),
          color: kWhite,
          iconOrImage: Image.network(
              'https://pixabay.com/vectors/man-male-avatar-anonymous-shadow-303792/'),
          myText: 'UserName',
        )),
      ),
    );
  }
}
