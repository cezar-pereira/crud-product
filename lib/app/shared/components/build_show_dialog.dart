import 'dart:ui';

import 'package:flutter/material.dart';

class BuildShowDialog {
  final BuildContext context;
  final Widget widget;

  BuildShowDialog({required this.context, required this.widget});

  Future<bool> call() async {
    var result = await showDialog(
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) => Center(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: AlertDialog(
            contentPadding: const EdgeInsets.all(0),
            buttonPadding: const EdgeInsets.all(0),
            actionsPadding: const EdgeInsets.all(0),
            titlePadding: const EdgeInsets.all(0),
            content: widget,
          ),
        ),
      ),
    );

    if (result == null) {
      return false;
    } else {
      return result;
    }
  }
}
