import 'package:duqin/View/sub_pages/song_page.dart';
import 'package:duqin/components/root_page_head.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

const List<Tab> _tabs = [
  Tab(
    text: '歌曲',
  ),
  Tab(
    text: '推荐',
  ),
  Tab(
    text: '歌手',
  ),
  Tab(
    text: '小视频',
  ),
  Tab(
    text: '文章',
  ),
  Tab(
    text: '视频',
  ),
];

final List<Widget> _tabsContent = [
  SongPage(),
  Text('222222'),
  Text('333333'),
  Text('444444'),
  Text('555555'),
  Text('666666'),
];

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController =
        TabController(initialIndex: 1, length: _tabs.length, vsync: this);

    //监听切换
    // _tabController.addListener(() {
    //   print(_tabController.index);
    // });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RootPageHead(),
        bottom: TabBar(
          tabs: _tabs,
          controller: _tabController,
          isScrollable: true,
        ),
      ),
      body: TabBarView(
        children: _tabsContent,
        controller: _tabController,
      ),
    );
  }
}
