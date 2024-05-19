import 'package:flutter/material.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  void Function(String)? onFieldSubmitted,
  bool isPassword=false,
  Function()? onTap,
  String? Function(String?)? validator,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function()? suffixPressed,
  void Function(String)? onChanged
})=>TextFormField(
  controller:controller ,
  keyboardType:type,
  obscureText: isPassword,
  onFieldSubmitted: onFieldSubmitted,
  
  onTap:onTap,
    onChanged:onChanged,
    validator: validator,
  decoration: InputDecoration(
    labelText:label,
    border: const OutlineInputBorder(),
    prefixIcon: Icon(
        prefix
    ),
    suffixIcon: suffix!= null? IconButton(
      onPressed: suffixPressed,
      icon: Icon(
        suffix,
      ),
    ) :null,

  ),
);

