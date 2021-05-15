import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

const Map<String, String> _bottomNames = {
  "home": "首页",
  "music": "音乐",
  "create_media": "",
  "tiny_video": "小视频",
  "profile": "我的",
};

class _RootPageState extends State<RootPage> {
  //当前导航页索引
  int _currentIndex = 0;
  //底部导航树数组
  final List<BottomNavigationBarItem> _bottomNavBarlist = [];

  @override
  void initState() {
    super.initState();

    _bottomNames.forEach((key, value) {
      _bottomNavBarlist.add(_bottomNavBarItem(key, value));
    });
  }

  //底部切换
  void _onTapClick(int index) {
    if (index == 2) {
      return _onCreateMedia();
    }

    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("首页"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavBarlist,
        currentIndex: _currentIndex,
        onTap: _onTapClick,
        type: BottomNavigationBarType.fixed,
      ),
      floatingActionButton: _createMediaButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  BottomNavigationBarItem _bottomNavBarItem(String key, String value) {
    return BottomNavigationBarItem(
        icon: Image.asset(
          'assets/images/icons/$key.png',
          width: 24,
          height: 24,
        ),
        activeIcon: Image.asset(
          'assets/images/icons/${key}_active.png',
          width: 24,
          height: 24,
        ),
        label: value);
  }
}

//发布按钮
Widget _createMediaButton() {
  return Container(
    width: 44,
    height: 44,
    margin: EdgeInsets.only(top: 56),
    child: FloatingActionButton(
      onPressed: _onCreateMedia,
      child: Image.asset(
        'assets/images/icons/create_media.png',
      ),
    ),
  );
}

//发布按钮点击事件
void _onCreateMedia() {
  print("发布按钮点击");
}
