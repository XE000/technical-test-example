import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:technical_test_example/features/data/models/fruit_data.dart';
import 'package:technical_test_example/features/domain/entities/basket.dart';
import 'package:technical_test_example/features/domain/entities/fruit.dart';
import 'package:technical_test_example/features/domain/entities/fruit_container.dart';
import 'package:technical_test_example/features/domain/entities/tray.dart';
import 'package:technical_test_example/features/presentation/bloc/fruit_bloc.dart';
import 'package:technical_test_example/features/presentation/pages/fruit_page.dart';

import 'injection_container.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FruitTypeAdapter());
  Hive.registerAdapter(FruitAdapter());
  Hive.registerAdapter(FruitContainerAdapter());
  Hive.registerAdapter(TrayAdapter());
  Hive.registerAdapter(BasketAdapter());
  Hive.registerAdapter(FruitDataAdapter());
  await injectDepedencies();

  runApp(const TechnicalTestExample());
}

class TechnicalTestExample extends StatelessWidget {
  const TechnicalTestExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Technical Test Example',
      home: BlocProvider<FruitBloc>(
        create: (context) => injector(),
        child: const FruitPage(),
      ),
    );
  }
}
