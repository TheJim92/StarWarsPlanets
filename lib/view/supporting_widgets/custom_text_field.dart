import 'package:flutter/material.dart';

import '../../utils/validators.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final Validator validator;

  final bool isObscured;

  const CustomTextField({super.key, required this.controller, required this.label, required this.validator, this.isObscured = false});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(widget.label,
            ),
      ),
      controller: widget.controller,
      obscureText: widget.isObscured,
      validator: (input) {
        return Validators.validateField(
            widget.validator, input);
      },
    );
  }
}
