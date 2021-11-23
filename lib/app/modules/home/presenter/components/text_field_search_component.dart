import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextFieldSearchComponent extends StatelessWidget {
  final ValueChanged onChanged;
  const TextFieldSearchComponent({Key? key, required this.onChanged})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFADD9C5).withOpacity(0.25),
      ),
      child: TextField(
        style: Theme.of(context).textTheme.caption,
        cursorColor: Theme.of(context).primaryColor,
        onSubmitted: (value) {
          FocusScope.of(context).unfocus();
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          icon:
              Icon(Icons.search_rounded, color: Theme.of(context).primaryColor),
          border: InputBorder.none,
          hintText: 'Pesquisar',
          hintStyle: Theme.of(context).textTheme.caption,
        ),
      ),
    );
  }
}
