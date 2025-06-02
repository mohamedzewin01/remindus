import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    required this.usernameController,
    required this.hintText,
    this.textInputType,
    this.validator,
    required this.title,
    this.suffixIcon,
    this.onTap,
    this.readOnly,
    this.prefixIcon, this.maxLines,
  });

  final TextEditingController usernameController;

  final String hintText;
  final String title;
  final bool? readOnly;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLines;

  final TextInputType? textInputType;

  final String? Function(String?)? validator;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title.isEmpty  ? const SizedBox() :  Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
            fontSize: 14,
          ),
        ),
   SizedBox(height: 8),
        TextFormField(
          onTap: onTap,
          readOnly: readOnly ?? false,
          maxLines: maxLines ?? 1,
          controller: usernameController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[400]),
          ),
          keyboardType: textInputType,
          validator: validator,
        ),
        SizedBox(height: 12),
      ],
    );
  }
}
