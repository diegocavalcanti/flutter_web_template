import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';


class DcTextFieldCalendar extends StatelessWidget {
  final String labelText;

  final void Function(String? value)? onChanged;
  final void Function(String? value)? onSaved;
  final String hintText;
  final Widget prefixIcon;
  final TextEditingController controller;
  final String? Function(String? value)? validator;
  final String pattern;
  final int firstDate;
  final int lastDate;
  final DateTime initialDate;
  final List<TextInputFormatter>? inputFormatters;

  const DcTextFieldCalendar(
      {Key? key,
      required this.labelText,
      required this.controller,
      required this.initialDate,
      this.prefixIcon = const Icon(Icons.calendar_month),
      this.hintText = '',
      this.pattern = 'dd/MM/yyyy',
      this.onChanged,
      this.onSaved,
      this.validator,
      this.firstDate = 2000,
      this.lastDate = 2030,
      this.inputFormatters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
          keyboardType: TextInputType.datetime,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          onChanged: onChanged,
          onSaved: onSaved,
          validator: validator,
          inputFormatters: [MaskUtil.maskDate()],
          decoration: InputDecoration(
            labelStyle: const TextStyle(color: Color(0xFF000000)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
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
          onTap: () async {
            //desabilita aparecimento do teclado
            FocusScope.of(context).requestFocus(FocusNode());

            await showDatePicker(
              context: context,
              initialDate: initialDate,
              firstDate: DateTime(firstDate),
              lastDate: DateTime(lastDate),
            ).then((selectedDate) {
              if (selectedDate != null) {
                controller.text = DateFormat(pattern).format(selectedDate);
              }
            });
          }),
    );
  }
}



class MaskUtil {
  //
  static maskNumber() {
    return MaskTextInputFormatter(
        mask:
            '##############################################################################################################################',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);
  }

  static maskPhone() {
    return MaskTextInputFormatter(
        mask: '(##) #####-####',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);
  }

  static maskPhoneFull() {
    return MaskTextInputFormatter(
        mask: '+## (##) #####-####',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);
  }

  static maskDate() {
    return MaskTextInputFormatter(
        mask: '##/##/####',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);
  }

  static maskDateEn() {
    return MaskTextInputFormatter(
        mask: '####-##-##',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);
  }

  static maskCPF() {
    return MaskTextInputFormatter(
        mask: '###-###-###-##',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);
  }
}