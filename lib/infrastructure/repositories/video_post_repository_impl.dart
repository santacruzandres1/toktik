import 'package:toktik/domain/datasources/video_posts_datasourse.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';

class VideoPostRepositoryImpl implements VideoPostRepository{

  final VideoPostsDatasources videosDataSource;

  VideoPostRepositoryImpl(
    {required this.videosDataSource}
    );

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(int userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videosDataSource.getTrendingVideosByPage(page);
  }

}