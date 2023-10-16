import 'package:flutter/material.dart';
class RowScreen extends StatefulWidget {
  const RowScreen({super.key});

  @override
  State<RowScreen> createState() => _RowScreenState();
}

class _RowScreenState extends State<RowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Row'),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        color: Colors.blue,
        height: 40,
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                'Teks 1',
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                'Teks 2',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}