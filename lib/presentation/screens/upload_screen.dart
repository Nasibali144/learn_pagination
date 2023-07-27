import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learn_pagination/core/service_locator.dart';

import 'loading_screen.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  /// (control state) / (state manage)
  TextEditingController controller = TextEditingController();
  final ImagePicker picker = ImagePicker();
  File? image;
  bool isLoading = false;

  void cancelImage() {
    setState(() => image = null);
  }

  void pickImage(ImageSource source) async {
    Navigator.pop(context);
    try {
      final result = await picker.pickImage(source: source);
      image = File(result!.path);
      setState(() {});
    } on PlatformException {
      showMessage("Invalid image format");
    } catch (e) {
      showMessage("This device doesn't support camera");
    }
  }

  void showMessage(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  void getImage() async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text("Take a photo"),
                onTap: () => pickImage(ImageSource.camera),
              ),
              ListTile(
                title: const Text("Photo gallery"),
                onTap: () => pickImage(ImageSource.gallery),
              ),
            ],
          ),
        );
      },
    );
  }

  void uploadImage() async {
    final description = controller.text.trim();
    if(image != null && description.isNotEmpty) {
      setState(() => isLoading = true);
      final path = image!.path;
      String? message = await repository.uploadImage(path, description);
      if(message != null) {
        showMessage(message);
        image = null;
        controller.clear();
      }
      setState(() => isLoading = false);
    } else {
      showMessage("Please select image or filled description!");
    }
  }
  /// UI => widgets
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Cat'),
        actions: [
          IconButton(
            onPressed: uploadImage,
            icon: const Icon(Icons.cloud_upload_rounded),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              /// upload image
              Container(
                height: MediaQuery.sizeOf(context).width,
                width: MediaQuery.sizeOf(context).width,
                padding: const EdgeInsets.all(20),
                child: image != null
                    ? Stack(
                        fit: StackFit.expand,
                        children: [
                          Image(
                            image: FileImage(image!),
                            fit: BoxFit.cover,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: cancelImage,
                              icon: const Icon(
                                Icons.cancel,
                              ),
                            ),
                          ),
                        ],
                      )
                    : ColoredBox(
                        color: Colors.white30,
                        child: GestureDetector(
                          onTap: getImage,
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              const Icon(CupertinoIcons.paw, size: 250),
                              Positioned(
                                bottom: MediaQuery.sizeOf(context).width / 3.5,
                                child: const Icon(
                                  CupertinoIcons.add,
                                  size: 65,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
              const SizedBox(height: 10),

              /// description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: "Description",
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),

          /// screen lock
          if (isLoading) const LoadingScreen(),
        ],
      ),
    );
  }
}
