import 'package:duqin/components/song_card.dart';
import 'package:duqin/models/song_model.dart';
import 'package:duqin/services/song_service.dart';
import 'package:flutter/material.dart';

class SongPage extends StatefulWidget {
  @override
  _SongPageState createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
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

  @override
  Widget build(BuildContext context) {
    return Center(
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
