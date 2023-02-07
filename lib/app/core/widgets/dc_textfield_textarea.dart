import 'package:flutter/material.dart';

class DcTextFieldTextArea extends StatelessWidget {
  final String labelText;
  final String hintText;
  final int minLines;
  final int maxLines;
  final String value;
  final void Function(String? value)? onChanged;
  final void Function(String? value)? onSaved;
  final Widget prefixIcon;

  const DcTextFieldTextArea({
    Key? key,
    this.hintText = '',
    this.minLines = 2,
    this.maxLines = 6,
    this.value = '',
    required this.labelText,
    this.onChanged,
    this.onSaved,
    this.prefixIcon = const Icon(Icons.subject),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        minLines: minLines,
        maxLines: maxLines,
        onChanged: onChanged,
        onSaved: onSaved,
        initialValue: value,
        keyboardType: TextInputType.multiline,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelStyle: const TextStyle(color: Color(0xFF424242)),
          filled: true,
          fillColor: Colors.white,
          hoverColor: Colors.white60,
          isDense: true,
          contentPadding: const EdgeInsets.all(10),
          labelText: labelText,
          border: const OutlineInputBorder(),
          hintText: hintText,
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}
