import 'package:flutter/material.dart';


class NullAwareScreen extends StatelessWidget {
  NullAwareScreen({super.key});

  String? name;

  @override
  Widget build(BuildContext context) {
    name = 'Nanda Adisaputra';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Safety Null'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            if (name != null) {
              debugPrint(name!.length.toString());
            }
          },
          child: Text(name ?? 'Nama Cadangan'),
        ),
      ),
    );
  }
}