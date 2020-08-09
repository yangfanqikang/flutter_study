import 'package:flutter/material.dart';
import 'package:hello_world/find/CompanyItem.dart';
import 'package:hello_world/find/Model/company.dart';
import 'package:hello_world/find/companyDetail/CompanyDetail.dart';
import 'package:hello_world/provider/company_list.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FindScreen extends StatefulWidget {
  @override
  _FindScreenState createState() => _FindScreenState();
}

class _FindScreenState extends State<FindScreen> {
  var _companties = [];

  // ScrollController _scrollController = ScrollController();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  void initState() {
    super.initState();
    CompanyListProvider provider =
        Provider.of<CompanyListProvider>(context, listen: false);
    provider.refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('公司'),
      ),
      body: builderContent(),
    );
  }

  Widget builderContent() {
    return Consumer<CompanyListProvider>(builder: (context, provider, _) {
      return IndexedStack(
        index: provider.showValue,
        children: <Widget>[
          Center(
            child: CircularProgressIndicator(),
          ),
          buildListView(),
        ],
      );
    });
  }

  Widget buildListView() {
    CompanyListProvider provider =
        Provider.of<CompanyListProvider>(context, listen: false);
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: ClassicHeader(
          refreshingText: '正在加载中....',
          idleText: '下拉刷新',
          completeText: '加载完成',
          failedText: '数据刷新异常',
          releaseText: '松开刷新',
        ),
        footer: ClassicFooter(
          idleText: '加载更多数据',
          loadingText: '玩命加载中...',
          noDataText: '没有更多数据',
        ),
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        controller: _refreshController,
        child: ListView.builder(
          itemCount: provider.companyList.length,
          itemBuilder: (context, index) {
            Company company = provider.companyList[index];
            return InkWell(
              child: CompanyListItem(company),
              onTap: () {
                Navigator.of(context).push(
                  new MaterialPageRoute(builder: (c) {
                    return CompanyDetailScreen(provider.companyList[index]);
                  }),
                );
              },
            );
          },
        ));
  }

  void _onRefresh() async {
    CompanyListProvider provider =
        Provider.of<CompanyListProvider>(context, listen: false);
    bool isSuccess = await provider.refreshData();
    if (isSuccess) {
      _refreshController.refreshCompleted();
    } else {
      _refreshController.refreshFailed();
    }
  }

  void _onLoading() async {
    CompanyListProvider provider =
        Provider.of<CompanyListProvider>(context, listen: false);
    bool isSuccess = await provider.loadMoreData();
    if (isSuccess) {
      _refreshController.loadComplete();
    } else {
      _refreshController.loadFailed();
    }
  }
}
