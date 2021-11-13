import 'package:flutter/material.dart';
import '../../../core/styles/TextStyles.dart';

class MyTextField extends StatelessWidget {
  MyTextField(
      {Key? key,
      required this.type, required this.max, this.onChanged,
      this.error, required this.label, this.contexts, this.order,
      required this.icon}) : super(key: key);

  final TextInputType type;
  final int? max;
  final onChanged;
  final error;
  final String label;
  final BuildContext? contexts;
  final String? order;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: type,
      maxLength: max,
      onChanged: (value) {
        if (contexts == null) {
          onChanged(value);
        } else {
          onChanged(value, contexts, order);
        }
      },
      decoration: InputDecoration(
          prefixIcon: icon,
          border: const OutlineInputBorder(),
          labelText: label,
          errorText: error,
          labelStyle: TextStyles.textStyleDetail),
    );
  }
}
