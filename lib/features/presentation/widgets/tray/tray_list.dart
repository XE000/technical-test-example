import 'package:flutter/material.dart';
import 'package:technical_test_example/features/presentation/widgets/tray/tray_item.dart';

import '../../../domain/entities/tray.dart';

class TrayList extends StatelessWidget {
  final List<Tray> trays;

  const TrayList({super.key, required this.trays});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: trays.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TrayItem(
            trayIndex: index,
            fruits: trays[index].fruits,
          ),
        );
      },
    );
  }
}
