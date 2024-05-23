import 'package:addinfo/core/widget/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class CustomField extends StatefulWidget {
  final IconData icon;
  final String lable;
  final TextEditingController controller;
  final bool isPass;

  final bool showBorder;
  final Color? fillColor;
  final String? hint;
  final String? prefixText;
  final Function(String)? onChange;
  final Function(String)? onSubmitted;
  final bool? obscure;
  final TextInputType? inputType;
  final Widget? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? suffixPressed;
  final bool? ispassword;
  String? suffixtext;
  String? prefixtext;
  bool? centerTitle;
  final List<String>? dropdownItems;
  final void Function(String?)? onDropdownChanged;
  final Color? textColor;
  final double? width;
  final double? height;
  final Color? backgroundColor;
   CustomField({
    super.key,
    required this.icon,
    required this.lable,
    required this.controller,
    this.isPass = false,
    required this.showBorder,
    this.fillColor,
    this.hint,
    this.prefixText,
    this.onChange,
    this.onSubmitted,
    this.obscure,
    this.inputType,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixPressed,
    this.ispassword,
    this.dropdownItems,
    this.onDropdownChanged,
    this.textColor,
    this.width,
    this.height,
    this.backgroundColor,
  });

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextFormField(
        validator: (value) => value!.isEmpty ? "Requird" : null,
        obscureText: widget.isPass ? obscure : false,
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: widget.isPass
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      obscure = !obscure;
                    });
                  },
                  icon: const Icon(Iconsax.eye))
              : const SizedBox(),
          contentPadding: const EdgeInsets.all(16),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: kPrimaryColor)),
          labelText: widget.lable,
          prefixIcon: Icon(widget.icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.start,
        onTap: widget.suffixPressed,
        keyboardType: widget.inputType,
        onChanged: widget.onChange,
        onFieldSubmitted: widget.onSubmitted,
      ),
    );
  }
}
