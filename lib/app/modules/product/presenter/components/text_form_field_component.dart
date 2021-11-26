import 'package:flutter/material.dart';

class TextFormFieldComponent extends StatelessWidget {
  final String hint;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Function? validation;
  final String? prefixText;

  const TextFormFieldComponent({
    Key? key,
    required this.hint,
    this.prefixText,
    required this.controller,
    this.validation,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(hint, style: Theme.of(context).textTheme.bodyText1),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          style: Theme.of(context).textTheme.subtitle1,
          validator: validation != null ? (value) => validation!(value) : null,
          cursorColor: Theme.of(context).primaryColor,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red)),
            prefixIcon: prefixText != null
                ? Container(
                    width: double.minPositive,
                    alignment: Alignment.centerLeft,
                    child: Center(
                        child: Text(
                      '$prefixText',
                    )))
                : null,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            filled: true,
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.caption,
          ),
        ),
      ],
    );
  }
}
