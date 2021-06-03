import 'package:duqin/components/singer_card.dart';
import 'package:duqin/models/user_model.dart';
import 'package:duqin/services/singer_service.dart';
import 'package:flutter/material.dart';

class SingerPage extends StatefulWidget {
  @override
  _SingerPageState createState() => _SingerPageState();
}

class _SingerPageState extends State<SingerPage> {
  List<UserItem> _usersList = UserList([]).list;
  int page = 1;
  int limit = 10;
  bool hasMore = true;
  bool error = false;
  String errorMsg = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUsers();
  }

  //获取数据
  Future _getUsers({bool refresh = true}) async {
    try {
      // type: 'DQ_SINGER'
      Map<String, dynamic> result =
          await SingerService.getUsers(page: page, limit: 10);
      UserList userListModel = UserList.fromJson(result['data']);

      setState(() {
        hasMore = page * limit < result['total'];
        page++;

        if (refresh) {
          _usersList = userListModel.list;
        } else {
          _usersList.addAll(userListModel.list);
        }
      });
    } catch (e) {
      error = true;
      errorMsg = e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.builder(
          padding: EdgeInsets.only(top: 8),
          itemCount: _usersList.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisExtent: MediaQuery.of(context).size.width / 1.5,
            maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 1,
          ),
          itemBuilder: (BuildContext context, int index) {
            bool isEven = index.isEven;

            double pl = isEven ? 18 : 9;
            double pr = isEven ? 9 : 18;

            return Container(
              padding: EdgeInsets.only(top: 18, left: pl, right: pr),
              color: Colors.white,
              child: SingerCard(
                coverPictureUrl: _usersList[index].coverPictureUrl,
                nickname: _usersList[index].nickname,
                musicCount: _usersList[index].musicCount,
                musicPlayCount: _usersList[index].musicPlayCount,
              ),
            );
          }),
    );
  }
}
