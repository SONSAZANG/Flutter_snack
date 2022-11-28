import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "image/logo.png",
                    scale: 1.4,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                child: TabBar(
                  tabs: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        '로그인',
                      ),
                    ),
                    Container(
                      child: Text(
                        '회원가입',
                      ),
                    ),
                  ],
                  indicator: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1.8,
                        color: Colors.deepOrange,
                        strokeAlign: StrokeAlign.inside,
                      ),
                    ),
                  ),
                  labelColor: Colors.deepOrange,
                  unselectedLabelColor: Colors.grey,
                  controller: _tabController,
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(
                    color: Colors.yellow[200],
                    alignment: Alignment.center,
                    child: Text(
                      'Tab1',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Container(
                    color: Colors.green[200],
                    alignment: Alignment.center,
                    child: Text(
                      'Tab2',
                      style: TextStyle(fontSize: 30),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
