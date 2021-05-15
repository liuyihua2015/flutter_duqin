import 'package:duqin/models/song_model.dart';
import 'package:duqin/utils/util.dart';
import 'package:flutter/material.dart';

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
        ],
      ),
    );
  }

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
          )
        ],
      ),
    );
  }
}
