import 'package:duqin/config/app_colors.dart';
import 'package:duqin/models/song_model.dart';
import 'package:duqin/utils/util.dart';
import 'package:flutter/material.dart';

import 'avatar_role_name.dart';
import 'comment_like_read.dart';

class SongCard extends StatelessWidget {
  final SongItem songItem;
  const SongCard({Key key, this.songItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(toRpx(size: 40.0)),
      child: Row(
        children: [
          _songCover(),
          SizedBox(
            width: 8,
          ),
          _songContent(),
        ],
      ),
    );
  }

//封面
  Widget _songCover() {
    return SizedBox(
      width: 75,
      height: 75,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/common/lazy-1.png',
              image: songItem.coverPictureUrl,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Image.asset(
              'assets/images/icons/tiny_video.png',
              width: 30,
              height: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _songContent() {
    return Expanded(
      child: SizedBox(
        height: 75,
        child: Stack(
          children: [
            Text(
              songItem.cnName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: AppColors.active, fontSize: 16),
            ),
            Positioned(
                top: 25,
                child: Text(
                  songItem.enName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: AppColors.un3active, fontSize: 14),
                )),
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  SizedBox(
                    width: 110,
                    child: AvatarRoleName(
                      avatarUrl: songItem.userEntity.coverPictureUrl,
                      nickName: songItem.userEntity.nickname,
                      // type: songItem.userEntity.type,
                      // showType: true,
                    ),
                  ),
                  Expanded(
                    child: CommentListRead(
                      commentCount: songItem.commentCount,
                      thumbUpCount: songItem.thumbUpCount,
                      readCount: songItem.readCount,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
