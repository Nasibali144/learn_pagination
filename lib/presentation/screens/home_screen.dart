import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:learn_pagination/core/param/image_param.dart';
import 'package:learn_pagination/core/service_locator.dart';
import 'package:learn_pagination/domain/models/image/image.dart';
import 'package:learn_pagination/presentation/screens/loading_screen.dart';
import 'package:learn_pagination/presentation/screens/upload_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// (control state) / (state manage)
  List<CatImage> images = [];
  bool isLoading = false;
  late final ScrollController controller;
  int page = 0;
  final int limit = 20;

  @override
  void initState() {
    super.initState();
    initController();
    getAllImage();
  }

  void initController() {
    controller = ScrollController();
    controller.addListener(() {
      if (controller.position.pixels >= controller.position.maxScrollExtent &&
          (page + 1) * limit == images.length) {
        getAllImage(++page);
      }
    });
  }

  void getAllImage([int page = 0]) async {
    setState(() => isLoading = true);
    images.addAll(await repository
        .fetchAllCatImage(ImageParam(limit: limit, page: page)));
    setState(() => isLoading = false);
  }

  void goUploadScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const UploadScreen()));
  }

  /// UI => widgets
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cat App"),
      ),
      body: Stack(
        children: [

          MasonryGridView.builder(
              controller: controller,
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
              itemCount: images.length,
              itemBuilder: (context, index) {
                final image = images[index];
                final ratio = image.width / image.height;
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: AspectRatio(
                    aspectRatio: ratio,
                    child: CachedNetworkImage(
                      imageUrl: image.url,
                      placeholder: (context, url) => ColoredBox(
                        color: Colors.primaries[index % Colors.primaries.length],
                      ),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                );
              }),

          /// screen lock
          if (isLoading) const LoadingScreen(),

          /// screen unlock
          // if(isLoading) const Center(
          //   child: CircularProgressIndicator(),
          // ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: goUploadScreen,
        child: const Icon(CupertinoIcons.paw),
      ),
    );
  }
}
