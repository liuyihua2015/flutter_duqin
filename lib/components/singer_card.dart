import 'package:duqin/config/app_colors.dart';
import 'package:duqin/utils/util.dart';
import 'package:flutter/material.dart';

class SingerCard extends StatelessWidget {
  final String coverPictureUrl;
  final String nickname;
  final int musicCount;
  final int musicPlayCount;

  const SingerCard(
      {Key key,
      this.coverPictureUrl,
      this.nickname,
      this.musicCount,
      this.musicPlayCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1 / 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/common/lazy-1.png',
              image: coverPictureUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            nickname,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16),
          ),
        ),
        Row(
          children: [
            iconText(
              count: musicCount,
              title: " 歌曲",
              imageUrl: 'assets/images/icons/read.png',
            ),
            iconText(
              count: musicPlayCount,
              title: "播放",
              imageUrl: 'assets/images/icons/read.png',
            )
          ],
        )
      ],
    );
  }
}

class iconText extends StatelessWidget {
  const iconText({
    Key key,
    @required this.count,
    this.title,
    this.imageUrl,
  }) : super(key: key);

  final int count;
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
      children: [
        Image.asset(
          imageUrl,
          width: 16,
          height: 16,
        ),
        Expanded(
          child: Text(
            title + ':' + formatCharCount(count),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: AppColors.unactive, fontSize: 12),
          ),
        )
      ],
    ));
  }
}
