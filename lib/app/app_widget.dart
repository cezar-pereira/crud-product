import 'package:crud_products/app/shared/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CrudProduct',
      theme: LightTheme.theme(),
    ).modular();
  }
}
