import 'package:flutter/material.dart';
import 'package:hello_world/find/Model/company.dart';
import 'package:hello_world/find/companyDetail/DotsIndicator.dart';

import 'company_hot_job.dart';
import 'company_inc.dart';
import 'company_info.dart';

const double _kAppBarHeight = 256.0;

class CompanyDetailScreen extends StatefulWidget {
  final Company _company;
  CompanyDetailScreen(this._company);
  @override
  _CompanyDetailScreenState createState() => _CompanyDetailScreenState();
}

class _CompanyDetailScreenState extends State<CompanyDetailScreen>
    with TickerProviderStateMixin {
  List<Widget> _imagePages;
  List<String> _urls = [
    'https://img.bosszhipin.com/beijin/mcs/chatphoto/20170725/861159df793857d6cb984b52db4d4c9c.jpg',
    'https://img2.bosszhipin.com/mcs/chatphoto/20151215/a79ac724c2da2a66575dab35384d2d75532b24d64bc38c29402b4a6629fcefd6_s.jpg',
    'https://img.bosszhipin.com/beijin/mcs/chatphoto/20180207/c15c2fc01c7407b98faf4002e682676b.jpg'
  ];

  List<Tab> _tabs;
  TabController _controller;
  VoidCallback onChanged;
  int _currentIndex;
  Widget _companyTabContent;

  @override
  void initState() {
    super.initState();
    _imagePages = <Widget>[];
    _urls.forEach((String url) {
      _imagePages.add(new Container(
        color: Colors.black,
        child: new ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: new Image.network(
            url,
            height: _kAppBarHeight,
            fit: BoxFit.cover,
          ),
        ),
      ));
    });

    _companyTabContent = new CompanyInc(widget._company.inc);

    _tabs = [new Tab(text: "公司概况"), new Tab(text: "热招职位")];

    _controller = TabController(length: _tabs.length, vsync: this);
    onChanged = () {
      if (_currentIndex == 0) {
        _companyTabContent = new CompanyInc(widget._company.inc);
      } else {
        _companyTabContent = new CompanyHotJob();
      }
      setState(() {
        _currentIndex = this._controller.index;
      });
    };
    _controller.addListener(onChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox.fromSize(
                  size: Size.fromHeight(_kAppBarHeight),
                  child: IndicatorViewPager(pages: _imagePages),
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      new CompanyInfo(widget._company),
                      new Divider(),
                      new TabBar(
                        tabs: _tabs,
                        indicatorWeight: 3,
                        labelStyle: new TextStyle(fontSize: 16),
                        labelColor: Colors.black,
                        controller: _controller,
                      ),
                    ],
                  ),
                ),
                _companyTabContent,
              ],
            ),
          ),
          new Positioned(
            top: 25,
            left: 10,
            child: BackButton(color: Colors.white),
          ),
        ],
      ),
    );
  }
}