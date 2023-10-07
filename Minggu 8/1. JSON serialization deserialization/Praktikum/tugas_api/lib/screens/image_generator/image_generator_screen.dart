import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tugas_api/screens/image_generator/image_generator_view_model.dart';
import 'package:tugas_api/widgets/botton_navigation_bar_global.dart';

class ImageGeneratorScreen extends StatefulWidget {
  const ImageGeneratorScreen({super.key});

  @override
  State<ImageGeneratorScreen> createState() => _ImageGeneratorScreenState();
}

class _ImageGeneratorScreenState extends State<ImageGeneratorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Generator"),
      ),
      body: Consumer<ImageGeneratorViewModel>(
        builder: (context, value, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                value.avatar != ""
                    ? SvgPicture.string(
                        value.avatar,
                        width: 150,
                      )
                    : const Icon(Icons.image),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: 152,
                  child: TextField(
                    controller: value.seedController,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: "Image Seed",
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                FilledButton(
                  onPressed: () {
                    value.getAvatar(seed: value.seedController.text);
                  },
                  child: const Text("Generate Image"),
                )
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomNavigationBarGlobal(),
    );
  }
}
