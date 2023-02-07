import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DcTextFieldNumber extends StatelessWidget {
  final String labelText;
  final String hintText;
  final int initialValue;
  final void Function(String? value) onChanged;
  // final void Function(String? value)? onSaved;
  final Widget prefixIcon;
  final TextEditingController controller;
  final String? Function(String? value)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const DcTextFieldNumber({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.initialValue,
    required this.onChanged,
    this.prefixIcon = const Icon(Icons.tag),
    this.hintText = '',
    // this.onSaved,
    this.validator,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
          keyboardType: TextInputType.number,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          initialValue: initialValue.toString(),
          onChanged: onChanged,
          //onSaved: onSaved,
          validator: validator,
          controller: controller,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            labelStyle: const TextStyle(color: Color(0xFF000000)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            filled: true, //<-- SEE HERE
            fillColor: Colors.white,
            hoverColor: Colors.white60,
            isDense: true,
            contentPadding: const EdgeInsets.all(10),
            labelText: labelText,
            border: const OutlineInputBorder(),
            hintText: hintText,
            prefixIcon: prefixIcon,
          )),
    );
  }
}
