import 'package:toktik/domain/datasources/video_posts_datasourse.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_post.dart';

class LocalVideoDataSource implements VideoPostsDatasources{
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(int userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async{
    await Future.delayed(const Duration(seconds: 2));    
      final List<VideoPost> newVideos = videoPosts.map((index) =>
            LocalVideoModel.fromJson(index).toVideoPostEntity())
        .toList();
        return newVideos;
  }

}