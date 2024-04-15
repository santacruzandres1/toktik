import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_player.dart';

class VideoScrollableView extends StatelessWidget {

  final List<VideoPost> videos;
  const VideoScrollableView({
    super.key,
    required this.videos
    
    });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: videos.length,
      itemBuilder: (context, index) {
       final VideoPost videoPost = videos[index]; 
       return Stack(
        children: [
          //videoplayer +gradientes
          //botones
          Positioned(
            bottom: 40,
            right: 10 ,
            child: VideoButtons(video: videoPost)),
        ],
       );
      },
      scrollDirection: Axis.vertical,
    );
  }
}