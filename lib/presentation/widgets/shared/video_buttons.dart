import 'package:flutter/material.dart';
import 'package:toktik/config/helpers/human_formats.dart';
import 'package:toktik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;
  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _CustomButton(
        value: video.likes,
        iconColor: Colors.red,
        iconData: Icons.favorite, 
      )
    ]);
  }
}

class _CustomButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color? color;

  const _CustomButton(
      {required this.value, required this.iconData, iconColor}):color = iconColor ?? Colors.white; 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(iconData, color: color, size: 35,),
            ),
        Text(HumanFormats.humanReadebleNumber(value.toDouble()))
      ],
    );
  }
}
