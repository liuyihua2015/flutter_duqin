import 'package:flutter/cupertino.dart';

/// 用户列表模型
class UserList {
  /// 包含 UserItem 模型的集合
  List<UserItem> list;

  UserList(this.list);

  /// 循环后台返回的数组 将每一项组装成 UserItem
  factory UserList.fromJson(List<dynamic> list) {
    return UserList(
      list.map((item) => UserItem.fromJson(item)).toList(),
    );
  }
}

/// 用户列表项/用户详情模型
class UserItem {
  /// 此处定义数据表中的字段(或接口返回的)即可
  final int id;
  final String coverPictureUrl;
  final String nickname;
  final String type;
  final int musicCount;
  final int musicPlayCount;

  UserItem({
    @required this.id,
    @required this.coverPictureUrl,
    @required this.nickname,
    @required this.type,
    @required this.musicCount,
    @required this.musicPlayCount,
  });

  /// 将 Json 数据转换为实体模型
  factory UserItem.fromJson(dynamic item) {
    return UserItem(
      id: item['id'],
      coverPictureUrl: item['coverPictureUrl'],
      nickname: item['nickname'],
      type: item['type'],
      musicCount: item['musicCount'],
      musicPlayCount: item['musicPlayCount'],
    );
  }
}
