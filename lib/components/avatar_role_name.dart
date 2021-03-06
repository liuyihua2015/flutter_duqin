import 'package:duqin/config/app_colors.dart';
import 'package:duqin/utils/user_type.dart';
import 'package:flutter/material.dart';

class AvatarRoleName extends StatelessWidget {
  final String avatarUrl;
  final String nickName;
  final String type;
  final bool showType;

  const AvatarRoleName(
      {Key key,
      this.avatarUrl,
      this.nickName,
      this.type,
      this.showType = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _avatar(),
        Offstage(offstage: !showType, child: _role()),
        _avatarName(),
      ],
    );
  }

  Widget _avatar() {
    return SizedBox(
      width: 20,
      height: 20,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/common/lazy-1.png', image: avatarUrl),
      ),
    );
  }

  Widget _avatarName() {
    return Expanded(
        child: Container(
      margin: EdgeInsets.only(left: 6),
      child: Text(
        nickName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: AppColors.unactive, fontSize: 14),
      ),
    ));
  }

  Widget _role() {
    return Container(
      margin: EdgeInsets.only(left: 6),
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 3),
      decoration: BoxDecoration(
        color: UserType.fromColor(type),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        UserType.fromCn(type) ?? '未知',
        style: TextStyle(color: Colors.white, fontSize: 10),
      ),
    );
  }
}
