import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test_example/features/presentation/widgets/basket/basket_list.dart';
import 'package:technical_test_example/features/presentation/widgets/tray/tray_list.dart';

import '../bloc/fruit_bloc.dart';

class FruitPage extends StatelessWidget {
  const FruitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fruit')),
      body: BlocBuilder<FruitBloc, FruitState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: TrayList(trays: state.trays),
              ),
              Center(
                child: BasketList(baskets: state.baskets),
              ),
            ],
          );
        },
      ),
    );
  }
}
