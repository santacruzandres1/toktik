import 'package:flutter/material.dart';
import 'package:toktik/presentation/widgets/video/video_brackground.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;

  const FullScreenPlayer(
      {super.key, required this.videoUrl, required this.caption});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController controller;
  @override
  void initState() {
    //inicilizar video
    super.initState();
    controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    //para limpiar el controlador

    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(), 
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
        return const Center(
          child:CircularProgressIndicator(strokeWidth: 2, strokeAlign: 5,) ,
          );          
        }
          return GestureDetector(
            onTap: () {
              if (controller.value.isPlaying) {
                controller.pause();
                return;
              }
              controller.play();
            },
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child:Stack(
                children: [
                   VideoPlayer(controller),
                   //gradiente por encima
                   VideoBackground(stops: const [0.8,1.0]),
                   //y el texo por encima del gradiente
                  Positioned(
                  bottom: 50,
                  left: 20,
                  child:VideoCaption(caption: widget.caption,),
            
                  
                  )
                ],
                ),
              ),
          );
      },
      
      );
  }
}

class VideoCaption extends StatelessWidget {

  final String caption;
   
  const VideoCaption({super.key, required this.caption});

  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
    final titlestyle = Theme.of(context).textTheme.titleLarge;
    return SizedBox(
      width: size.width*0.6,
      child: Text(caption, maxLines: 2, style: titlestyle),
    );
  }
}