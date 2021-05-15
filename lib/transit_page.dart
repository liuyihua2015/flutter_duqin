import 'dart:async';

import 'package:duqin/root_page.dart';
import 'package:flutter/material.dart';

class TransitPage extends StatefulWidget {
  @override
  _TransitPageState createState() => _TransitPageState();
}

class _TransitPageState extends State<TransitPage> {
  Timer _timer;
  int _currentTime = 6;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        _currentTime--;
      });
      if (_currentTime <= 0) {
        _jumpRootPage();
      }
    });
  }

//跳转首页
  void _jumpRootPage() {
    _timer.cancel();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => RootPage(),
        ),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          'assets/images/common/page.png',
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Positioned(
          child: InkWell(onTap: _jumpRootPage, child: _clipButton()),
          top: MediaQuery.of(context).padding.top + 10,
          right: 10,
        )
      ],
    ));
  }

  Widget _clipButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 50,
        height: 50,
        color: Colors.black.withOpacity(0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "跳过",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            Text(
              "$_currentTime" + "s",
              style: TextStyle(color: Colors.white, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
