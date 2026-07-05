import 'package:flutter/material.dart';

/// `TextFormField` + brand `inputDecorationTheme`.
class KorasTextField extends StatelessWidget {
  const KorasTextField({
    super.key,
    required this.controller,
    required this.label,
    this.obscure = false,
    this.validator,
    this.keyboardType,
    this.hintText,
    this.enabled = true,
    this.onSubmitted,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String label;
  final bool obscure;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? hintText;
  final bool enabled;
  final ValueChanged<String>? onSubmitted;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      validator: validator,
      keyboardType: keyboardType,
      enabled: enabled,
      onFieldSubmitted: onSubmitted,
      maxLines: obscure ? 1 : maxLines,
      decoration: InputDecoration(labelText: label, hintText: hintText),
    );
  }
}
