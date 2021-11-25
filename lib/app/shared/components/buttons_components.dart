// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ButtonsComponents extends StatelessWidget {
  final Widget label;
  final Color color;
  final BuildContext context;
  final double height;
  final double width;
  final VoidCallback onTap;

  ButtonsComponents.smallConfirm(
      {required this.onTap,
      required this.context,
      required this.label,
      double? height,
      double? width})
      : color = Theme.of(context).hintColor,
        height = height ?? 40,
        width = width ?? 80;

  ButtonsComponents.mediumConfirm(
      {required this.onTap,
      required this.context,
      required this.label,
      double? height,
      double? width})
      : color = Theme.of(context).hintColor,
        height = height ?? 45,
        width = width ?? 120;

  ButtonsComponents.largeConfirm(
      {required this.onTap,
      required this.context,
      required this.label,
      double? height,
      double? width})
      : color = Theme.of(context).hintColor,
        height = height ?? 45,
        width = width ?? 250;

  ButtonsComponents.smallCancel(
      {required this.onTap,
      required this.context,
      required this.label,
      double? height,
      double? width})
      : color = Theme.of(context).colorScheme.secondary,
        height = height ?? 40,
        width = width ?? 80;

  ButtonsComponents.mediumCancel(
      {required this.onTap,
      required this.context,
      required this.label,
      double? height,
      double? width})
      : color = Theme.of(context).colorScheme.secondary,
        height = height ?? 45,
        width = width ?? 120;

  ButtonsComponents.largeCancel(
      {required this.onTap,
      required this.context,
      required this.label,
      double? height,
      double? width})
      : color = Theme.of(context).colorScheme.secondary,
        height = height ?? 45,
        width = width ?? 250;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: label,
        height: height,
        width: width,
      ),
    );
  }
}
