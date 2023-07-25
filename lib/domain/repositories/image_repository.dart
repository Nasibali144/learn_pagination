import 'dart:convert';
import 'package:learn_pagination/core/param/apis.dart';
import 'package:learn_pagination/core/param/image_param.dart';
import 'package:learn_pagination/data/network_service.dart';
import 'package:learn_pagination/domain/models/image/image.dart';

abstract class ImageRepository {
  Future<List<CatImage>> fetchAllCatImage(ImageParam param);
}

class ImageRepositoryImplementation implements ImageRepository {
  final Network network;

  const ImageRepositoryImplementation({required this.network});

  @override
  Future<List<CatImage>> fetchAllCatImage(ImageParam param) async {
    String response = await network.methodGet(api: Api.apiImages, query: param.toQueryParameters) ?? "[]";
    List data = jsonDecode(response);
    List<CatImage> images = data.map((item) => CatImage.fromJson(item)).toList();
    return images;
  }
}