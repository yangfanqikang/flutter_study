import 'package:flutter/material.dart';
import 'package:hello_world/find/Model/company.dart';

class CompanyListItem extends StatelessWidget {
  final Company companyModel;
  // 构造器
  CompanyListItem(this.companyModel);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
      child: Card(
        elevation: 10.0,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 15,
                    right: 15,
                    bottom: 0,
                  ),
                  child: Image.network(
                    companyModel.logo,
                    width: 50,
                    height: 50,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 5,
                    left: 0,
                    right: 5,
                    bottom: 5,
                  ),
                  child: Text(
                    companyModel.location.substring(
                        0,
                        companyModel.location.length > 6
                            ? 6
                            : companyModel.location.length),
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 5,
                    left: 5,
                    right: 10,
                    bottom: 5,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "|" + companyModel.type,
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "|" + companyModel.size,
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "|" + companyModel.employee,
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: 5,
                    left: 10,
                    right: 10,
                    bottom: 15,
                  ),
                  child: new Text(
                      "热招: " +
                          companyModel.hot +
                          " 等" +
                          companyModel.count +
                          " 个职位",
                      style: new TextStyle(fontSize: 13, color: Colors.grey)),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 8,
                        ),
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
