import 'package:duqin/models/user_model.dart';
import 'package:flutter/cupertino.dart';

/// 列表模型
class SongList {
  List<SongItem> list;

  SongList(this.list);

  factory SongList.fromJson(List<dynamic> list) {
    return SongList(
      list.map((item) => SongItem.fromJson(item)).toList(),
    );
  }
}

/// 列表项/详情模型
class SongItem {
  final int id;
  final int userId;
  final UserItem userEntity; // 这个是用户模型
  final String coverPictureUrl;
  final String songUrl;
  final String cnName;
  final String enName;
  final int commentCount;
  final int thumbUpCount;
  final int readCount;

  SongItem({
    @required this.id,
    @required this.userId,
    @required this.userEntity,
    @required this.coverPictureUrl,
    @required this.songUrl,
    @required this.cnName,
    @required this.enName,
    @required this.commentCount,
    @required this.thumbUpCount,
    @required this.readCount,
  });

  factory SongItem.fromJson(dynamic item) {
    return SongItem(
      id: item['id'],
      userId: item['userId'],
      userEntity: UserItem.fromJson(item['user']), // 将用户数据转为用户模型
      coverPictureUrl: item['coverPictureUrl'],
      songUrl: item['songUrl'],
      cnName: item['cnName'],
      enName: item['enName'],
      commentCount: item['commentCount'],
      thumbUpCount: item['thumbUpCount'],
      readCount: item['readCount'],
    );
  }
}
