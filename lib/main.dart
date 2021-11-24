import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

import 'dart:developer' as developer;

import 'app/modules/home/infra/models/hive/product_model_hive.dart';
import 'app/modules/home/infra/models/hive/size_product_model_hive.dart';

Future _openBox() async {
  try {
    await Hive.initFlutter();
    Hive.registerAdapter(ProductModelHiveAdapter());
    Hive.registerAdapter(SizeProductModelHiveAdapter());
  } catch (e, stackTrace) {
    developer.log('ERROR: $e', name: '_openBox', stackTrace: stackTrace);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _openBox();
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
