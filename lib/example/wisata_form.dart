import 'package:flutter/material.dart';
import 'package:basic_flutter/model/item.dart';

class WisataForm extends StatefulWidget {
  const WisataForm({super.key, this.data, required this.onDataReceived});

  final Item? data;
  final Function(Item) onDataReceived;

  @override
  State<WisataForm> createState() => _WisataFormState();
}

class _WisataFormState extends State<WisataForm> {
  final nameController = TextEditingController();
  final descController = TextEditingController();
  final imageController = TextEditingController();

  Item? data;

  @override
  void initState() {
    data = widget.data;
    nameController.text = data?.name ?? '';
    descController.text = data?.description ?? '';
    imageController.text = data?.imageURL ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 500,
        minWidth: double.infinity,
      ),
      padding: const EdgeInsets.only(
        top: 16,
        left: 8,
        right: 8,
        bottom: 16,
      ),
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverToBoxAdapter(
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nama',
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 8),
          ),
          SliverToBoxAdapter(
            child: TextField(
              controller: descController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Deskripsi',
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 8)),
          SliverToBoxAdapter(
            child: TextField(
              controller: imageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'URL Gambar',
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => editItem(context),
                child: const Text('Konfirmasi'),
              ),
            ),
          )
        ],
      ),
    );
  }

  editItem(BuildContext context) {
    if (nameController.text.isEmpty) {
      showAlert(context: context, message: 'Nama tidak boleh kosong');
      return;
    }

    if (descController.text.isEmpty) {
      showAlert(context: context, message: 'Deskripsi tidak boleh kosong');
      return;
    }

    if (imageController.text.isEmpty) {
      showAlert(context: context, message: 'Gambar tidak boleh kosong');
      return;
    }

    if (!isURLValid(imageController.text)) {
      showAlert(context: context, message: 'URL Gambar tidak valid');
      return;
    }

    if (data == null) {
      data = Item(
        name: nameController.text,
        description: descController.text,
        imageURL: imageController.text,
      );
    } else {
      data?.setData(
        name: nameController.text,
        description: descController.text,
        imageURL: imageController.text,
      );
    }

    widget.onDataReceived(data!);
    Navigator.of(context).pop();
  }

  bool isURLValid(String urlString) {
    final regex = RegExp(
      r'^(http(s)?:\/\/)?(www\.)?[a-zA-Z0-9-_\.]+(\.[a-zA-Z]{2,})(:\d{1,5})?(\/\S*)?$',
      caseSensitive: false,
      multiLine: false,
    );

    return regex.hasMatch(urlString);
  }

  void showAlert({required BuildContext context, required String message}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Submission Flutter Pemula Dicoding'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Dismiss'),
            ),
          ],
        );
      },
    );
  }
}