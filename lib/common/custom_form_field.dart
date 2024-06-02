import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController Mycontroller;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final ValueChanged<String>? onChanged;

  CustomFormField(
      this.labelText, {
        required this.Mycontroller,
        this.keyboardType = TextInputType.text,
        this.validator,
        this.obscureText = false,
        this.onChanged,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: TextFormField(
        controller: Mycontroller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
