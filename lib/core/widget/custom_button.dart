import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.text,
      this.color,
      this.textcolor,
      this.onTap,
      this.icon,
      this.width = double.infinity,
      this.height = 60.0,
      this.circular = 30.0});
  String? text;
  Color? color;
  Color? textcolor;
  VoidCallback? onTap;
  IconData? icon;
  final double? width;
  final double? height;
  final double? circular;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(circular!),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text!,
                style: TextStyle(color: textcolor),
              ),
              const SizedBox(width: 8.0),
              Icon(
                icon,
                color: Theme.of(context).colorScheme.background,
                size: 24.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
