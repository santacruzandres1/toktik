import 'package:animate_do/animate_do.dart';
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
      ),
      const SizedBox(
        height: 1,
      ),
      _CustomButton(value: video.views, iconData: Icons.remove_red_eye_outlined),
      const SizedBox(
        height: 15,
      ),
      SpinPerfect(
        infinite: true,
        duration: const Duration(seconds: 8),
        child: const _CustomButton(value: 0, iconData: Icons.play_circle_outline_outlined))
    ]);
  }
}

class _CustomButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color? color;

  const _CustomButton({required this.value, required this.iconData, iconColor})
      : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              iconData,
              color: color,
              size: 30,
            )),
            if(value > 0)
        Text(HumanFormats.humanReadebleNumber(value.toDouble()))
      ],
    );
  }
}
