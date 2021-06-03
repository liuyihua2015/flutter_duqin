import 'package:duqin/components/song_card.dart';
import 'package:duqin/models/song_model.dart';
import 'package:duqin/services/song_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class SongPage extends StatefulWidget {
  @override
  _SongPageState createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  EasyRefreshController _easyRefreshController;

  List<SongItem> _songList = SongList([]).list;
  int page = 1;
  int limit = 10;
  bool hasMore = true;
  bool error = false;
  String errorMsg = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _easyRefreshController = EasyRefreshController();
    _getSongs();
  }

  //获取数据
  Future _getSongs({bool refresh = true}) async {
    try {
      Map<String, dynamic> result = await SongService.getSongs(page: page);
      SongList songListModel = SongList.fromJson(result['data']);

      setState(() {
        hasMore = page * limit < result['total'];
        page++;

        if (refresh) {
          _songList = songListModel.list;
        } else {
          _songList.addAll(songListModel.list);
        }
      });
    } catch (e) {
      error = true;
      errorMsg = e.toString();
    }
  }

  // 下拉刷新 callback
  Future _onRefresh() async {
    page = 1;
    await _getSongs(refresh: true);
    //
    _easyRefreshController.finishLoad();
    _easyRefreshController.resetLoadState();
  }

  // 上拉加载 callback
  Future _onLoad() async {
    if (hasMore) {
      await _getSongs(refresh: false);
    }
    _easyRefreshController.finishLoad(noMore: !hasMore);
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      controller: _easyRefreshController,
      onRefresh: _onRefresh,
      onLoad: _onLoad,
      header: ClassicalHeader(),
      footer: ClassicalFooter(),
      enableControlFinishLoad: true,
      enableControlFinishRefresh: true,
      child: ListView.builder(
          itemCount: _songList.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(children: [
              SizedBox(
                height: 10,
              ),
              SongCard(
                songItem: _songList[index],
              ),
            ]);
          }),
    );
  }
}
