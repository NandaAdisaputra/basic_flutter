import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            height: 200,
            width: 200,
            color: Colors.grey,
            child: const Image(
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              image: AssetImage('assets/images/bali.jpg'),
            ),
          ),
          Image(
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return const Text('Loading ...');
              }
            },
            image: const NetworkImage(
                'https://studio.mrngroup.co/storage/app/media/Prambors/Editorial%202/Bali-20230127134141.webp?tr=w-600'),
          )
        ],
      ),
    );
  }
}