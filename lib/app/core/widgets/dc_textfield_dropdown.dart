import 'package:flutter/material.dart';

class DcTextFieldDropDown extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String initialValue;
  final List<String> dropDownList;
  final Widget prefixIcon;
  final void Function(dynamic value) onChanged;
  //final void Function(String? value)? onSaved;
  //final SingleValueDropDownController? controller;
  final String? Function(String? value)? validator;
  final int dropDownItemCount;

  const DcTextFieldDropDown({
    Key? key,
    required this.labelText,
    required this.dropDownList,
    required this.initialValue,
    required this.onChanged,
    //this.controller,
    this.prefixIcon = const Icon(Icons.search),
    this.dropDownItemCount = 10,
    this.hintText = '',

    //this.onSaved,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DropdownButtonFormField<String>(
        hint: Text(labelText),
        value: initialValue,
        items: dropDownList
            .map((op) => DropdownMenuItem(
                  value: op,
                  child: Text(op),
                ))
            .toList(),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Color(0xFF000000)),
          filled: true,
          fillColor: Colors.white,
          hoverColor: Colors.white60,
          isDense: true,
          contentPadding: const EdgeInsets.all(10),
          border: const OutlineInputBorder(),
          hintText: hintText,
          prefixIcon: prefixIcon,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        validator: validator,
        onChanged: onChanged,
        //onSaved: onSaved,
      ),
    );
  }
}
