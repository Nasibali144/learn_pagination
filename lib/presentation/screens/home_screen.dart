import 'package:flutter/material.dart';
import 'package:learn_pagination/core/param/image_param.dart';
import 'package:learn_pagination/core/service_locator.dart';
import 'package:learn_pagination/domain/models/image/image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// (control state) / (state manage)
  List<CatImage> images = [];

  @override
  void initState() {
    super.initState();
    getAllImage();
  }

  void getAllImage() async {
    images.addAll(await repository.fetchAllCatImage(const ImageParam(limit: 20)));
    setState(() {});
  }

  /// UI => widgets
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cat App"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          final image = images[index];
          return Image(
            image: NetworkImage(image.url),
            errorBuilder: (_, msg, __) => const Icon(Icons.warning_rounded),
          );
        },
      ),
    );
  }
}
