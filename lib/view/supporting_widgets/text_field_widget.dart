import 'package:flutter/material.dart';

import '../../utils/validators.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final Validator validator;

  const TextFieldWidget({super.key, required this.controller, required this.label, required this.validator});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(widget.label,
            ),
      ),
      controller: widget.controller,
      validator: (input) {
        return Validators.validateField(
            widget.validator, input);
      },
    );
  }
}
