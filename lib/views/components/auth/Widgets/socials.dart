import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Socials extends StatelessWidget {
  const Socials({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(FontAwesomeIcons.facebook, size: 40),
        SizedBox(width: 20),
        Icon(FontAwesomeIcons.google, size: 40),
        SizedBox(width: 20),
        Icon(FontAwesomeIcons.instagram, size: 40),
      ],
    );
  }
}
