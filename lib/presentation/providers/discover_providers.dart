import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_post.dart';

class DiscoverProviders extends ChangeNotifier {
  bool initialLoading =
      true; //cuando se lanza la aplicacion no tenemos videos, entocnces ponemos a cargar los videos con initialLoading
  List<VideoPost> videos = [];
// To Do: Repository, DataSource a aplicar en la seccion 8
  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts.map((index) =>
            LocalVideoModel.fromJson(index).toVideoPostEntity())
        .toList();
    //To DO: cargar videos
    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
