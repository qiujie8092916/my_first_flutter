import 'package:flutter/material.dart';

import 'package:my_first_flutter/style/index.dart';
import 'package:my_first_flutter/helpers/utils.dart';

/// request && model
import 'package:my_first_flutter/request/index.dart';
import './model/module_list_model.dart';

class Modules extends StatefulWidget {
  @override
  _ModulesState createState() => new _ModulesState();
}

class _ModulesState extends State<Modules> {
  ModuleListModel _moduleList;

  void queryModuleList() async {
    final Map res = await HttpRequest.queryModuleList.execute();

    setState(() {
      _moduleList = ModuleListModel.fromJson(res);
    });
  }

  @override
  void initState() {
    super.initState();

    /// 获取行程数据
    this.queryModuleList();
  }

  @override
  Widget build(BuildContext context) {
    final $ = Styles(context);

    return (_moduleList != null && _moduleList?.dataList.length > 0)
        ? Container(
            margin: EdgeInsets.only(
                left: $.px(12), right: $.px(12), bottom: $.px(10)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                // padding: EdgeInsets.all($.px(8)),
                color: Color.fromRGBO(255, 255, 255, 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _moduleList.dataList
                      .map(
                        (item) => Expanded(
                          child: Container(
                            // width: $.px(351) / _moduleList.dataList.length,
                            padding: EdgeInsets.all($.px(8)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: $.px(4)),
                                  child: Text(
                                    item.title,
                                    style: TextStyle(
                                      height: $.px(1.25),
                                      fontWeight: FontWeight.bold,
                                      fontSize: $.px(16),
                                      color: Color.fromRGBO(41, 43, 53, 1),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: $.px(6)),
                                  child: Text(
                                    item.subTitle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      height: $.px(1.0625),
                                      fontSize: $.px(13),
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(100, 110, 122, 1),
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    item.img,
                                    width: $.px(155),
                                    height: $.px(96),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          )
        : Container();
  }
}
