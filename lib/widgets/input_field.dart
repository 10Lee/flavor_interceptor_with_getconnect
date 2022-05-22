import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class InputField extends StatelessWidget {
  final String hint;
  final String title;
  final TextEditingController controller;
  final bool isPass;
  final TextInputType keyboardType;

  const InputField({
    Key? key,
    required this.hint,
    required this.title,
    required this.controller,
    this.isPass = false,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
        borderSide: Divider.createBorderSide(context, width: 2.0));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$title'),
        const SizedBox(height: 10),
        TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please fill in this field';
            }
          },
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            border: inputBorder,
            enabledBorder: inputBorder,
            focusedBorder: inputBorder,
          ),
          obscureText: isPass,
          keyboardType: keyboardType,
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
