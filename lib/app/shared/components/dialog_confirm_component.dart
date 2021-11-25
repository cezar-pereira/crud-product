import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'buttons_components.dart';

class DialogConfirmComponent extends StatelessWidget {
  final String title;
  final String content;
  const DialogConfirmComponent(
      {Key? key, required this.title, this.content = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      height: 350,
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title,
              style: const TextStyle(fontSize: 24, color: Colors.black)),
          Text(
            content,
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonsComponents.mediumCancel(
                    onTap: () {
                      Modular.to.pop(false);
                    },
                    context: context,
                    label: Text('Cancelar',
                        style: Theme.of(context).textTheme.button)),
                ButtonsComponents.mediumConfirm(
                    onTap: () {
                      Modular.to.pop(true);
                    },
                    context: context,
                    label: Text('Confirmar',
                        style: Theme.of(context).textTheme.button)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
