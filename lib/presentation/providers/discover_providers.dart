import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  
  final VideoPostRepository videoPostRepository;
  bool initialLoading =
      true; //cuando se lanza la aplicacion no tenemos videos, entocnces ponemos a cargar los videos con initialLoading
  List<VideoPost> videos = [];

  DiscoverProvider({
    required this.videoPostRepository
    });


// To Do: Repository, DataSource a aplicar en la seccion 8
  Future<void> loadNextPage() async {
    // await Future.delayed(const Duration(seconds: 2)); //simula carga de datos

    // final List<VideoPost> newVideos = videoPosts.map((index) =>
    //         LocalVideoModel.fromJson(index).toVideoPostEntity())
    //     .toList();

    final newVideos = await videoPostRepository.getTrendingVideosByPage(1);
    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
