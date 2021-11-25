import 'package:flutter/material.dart';

class SnackBarSuccessCustom {
  final BuildContext context;
  final String success;
  SnackBarSuccessCustom({required this.context, required this.success});
  ScaffoldFeatureController call() {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      backgroundColor: Theme.of(context).hintColor,
      content: Text(success, style: const TextStyle(fontSize: 18)),
    ));
  }
}
