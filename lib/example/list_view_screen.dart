import 'package:flutter/material.dart';


class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List View'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.yellow,
            height: 50,
            width: double.infinity,
            alignment: Alignment.center,
            child: const Text('16 Oktober 2023'),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return const SizedBox(
                    height: 40,
                    child: Text('Header'),
                  );
                } else {
                  return ListTile(
                    leading: const Icon(Icons.person),
                    title: Text('Item $index'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}