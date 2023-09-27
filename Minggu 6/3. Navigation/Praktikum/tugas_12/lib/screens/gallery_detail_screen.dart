import 'package:flutter/material.dart';
import 'package:tugas_12/models/gallery_model.dart';
// import 'package:tugas_12/models/gallery_model.dart';

class GalleryDetail extends StatelessWidget {
  // final Gallery item;
  const GalleryDetail({super.key});
  // const GalleryDetail({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as GalleryModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gallery Detail"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(arg.url),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                arg.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                arg.subtitle,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 64),
              Text(
                "Source: ${arg.url}",
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }
}
