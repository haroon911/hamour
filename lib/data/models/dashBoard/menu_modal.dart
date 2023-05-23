import 'package:flutter/material.dart';

class MenuModel {
  IconData icon;
  String title;
   final void Function() onTap;
  MenuModel({required this.icon, required this.title ,required this.onTap,});
}
