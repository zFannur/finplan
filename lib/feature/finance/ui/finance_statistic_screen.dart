import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FinanceStatisticScreen extends StatelessWidget {
  const FinanceStatisticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Card(
          margin: const EdgeInsets.all(5),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('stat $index'),
          ),
        );
      },
    );
  }
}