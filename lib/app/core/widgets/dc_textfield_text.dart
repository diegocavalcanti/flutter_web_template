import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DcTextFieldText extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String initialValue;
  final bool readonly;
  final void Function(String? value) onChanged;
  final Widget prefixIcon;
  final String? Function(String? value)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final double widthFactor;

  const DcTextFieldText({
    Key? key,
    required this.labelText,
    required this.initialValue,
    required this.onChanged,
    this.hintText = '',
    this.widthFactor = 1.0,
    this.readonly = false,
    this.prefixIcon = const Icon(Icons.short_text),
    this.validator,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: widthFactor,
          child: TextFormField(
            keyboardType: TextInputType.text,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            readOnly: readonly,
            initialValue: initialValue,
            onChanged: onChanged,
            validator: validator,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              filled: true,
              isDense: true,
              contentPadding: const EdgeInsets.all(10),
              labelText: labelText,
              border: const OutlineInputBorder(),
              hintText: hintText,
              prefixIcon: prefixIcon,
            ),
          ),
        ),
      ),
    );
  }
}
