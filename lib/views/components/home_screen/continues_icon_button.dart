
import 'package:flutter/material.dart';

class ContinuesIconButton extends StatelessWidget {
  const ContinuesIconButton({
    super.key,
    this.onPressed,
    this.icon,
  });
  final void Function()? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: IconButton(
          style: ButtonStyle(
              shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20)))),
          color: Colors.orange,
          onPressed: onPressed,
          icon: Icon(icon ?? Icons.arrow_back_ios_rounded)),
    );
  }
}
