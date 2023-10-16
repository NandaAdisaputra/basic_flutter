import 'package:flutter/material.dart';
import 'package:basic_flutter/example/wisata_form.dart';
import 'package:basic_flutter/model/item.dart';

class WisataDetailScreen extends StatefulWidget {
  const WisataDetailScreen(
      {super.key, required this.data, required this.onDataReceived});

  final Item data;
  final Function(Item) onDataReceived;

  @override
  State<WisataDetailScreen> createState() => _WisataDetailScreenState();
}

class _WisataDetailScreenState extends State<WisataDetailScreen> {
  Item? data;

  @override
  void initState() {
    data = widget.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Detail Wisata '),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Image(
              image: NetworkImage(data?.imageURL ?? ''),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
             child: Align(  alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text(
                      data?.name ?? '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  const SizedBox(height: 8),
                  Text(data?.description ?? ''),
                ],
              ),
            ),
          ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 45,
              margin: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    useSafeArea: true,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    builder: (context) {
                      return WisataForm(
                        data: data,
                        onDataReceived: (data) {
                          setState(() {
                            this.data = data;
                            widget.onDataReceived(data);
                          });
                        },
                      );
                    },
                  );
                },
                child: const Text('Ubah Data'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}