import 'package:flutter/material.dart';
import 'package:basic_flutter/example/wisata_detail_screen.dart';
import 'package:basic_flutter/example/wisata_form.dart';
import 'package:basic_flutter/model/item.dart';

class WisataListScreen extends StatefulWidget {
  const WisataListScreen({super.key});

  @override
  State<WisataListScreen> createState() => _WisataListScreenState();
}

class _WisataListScreenState extends State<WisataListScreen> {
  final controller = TextEditingController();
  List<Item> shopItems = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Wisata'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            child: Row(
              children: [
                const Expanded(child: Text('List Items')),
                IconButton(
                  onPressed: () => delete(),
                  icon: const Icon(Icons.clear_all_outlined),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: shopItems.length,
              itemBuilder: (context, index) {
                final item = shopItems[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  elevation: 4,
                  child: ListTile(
                    title: Text(item.name),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image(
                        fit: BoxFit.cover,
                        width: 40,
                        height: 40,
                        image: NetworkImage(item.imageURL),
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () => delete(idx: index),
                      icon: const Icon(Icons.delete_outline),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WisataDetailScreen(
                            data: item,
                            onDataReceived: (data) {
                              setState(() {
                                shopItems[index] = data;
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            useSafeArea: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            builder: (context) {
              return WisataForm(onDataReceived: (data) {
                setState(() {
                  shopItems.add(data);
                });
              });
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void delete({int? idx}) {
    if (idx != null) {
      setState(() {
        shopItems.removeAt(idx);
      });
    } else {
      setState(() {
        shopItems.clear();
      });
    }
  }

  void showAlert({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}