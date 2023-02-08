import 'package:bloodapp2/core/app_export.dart';
import 'package:bloodapp2/presentation/history_sign_screen/controller/history_sign_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HistorySignScreen extends GetView<HistorySignController> {
  HistorySignScreen({Key? key}) : super(key: key);

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  void _onRefresh() async {
    // controller.getNews();
    // print("refresh");

    controller.fetchData();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    print("loading");
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: ColorConstant.gray200,
        appBar: AppBar(
          title: Text("Nhật ký hiến máu"),
          bottom: TabBar(tabs: [
            Tab(
              child: Text("Đã hiến máu"),
            ),
            Tab(
              child: Text("Đã đăng ký"),
            ),
            Tab(
              child: Text("Đã huỷ bỏ"),
            )
          ]),
        ),
        body: TabBarView(children: [
          Container(
            margin: EdgeInsets.all(16).copyWith(top: 20),
            child: controller.obx(
                (state) => ListView.builder(
                      itemCount: (state!.item1["data"] as List).length,
                      itemBuilder: ((context, index) {
                        var data = state.item1["data"] as List;
                        var time = DateTime.parse(
                            data[index]["attributes"]["timesign"]);
                        var resultTime =
                            DateFormat("dd/MM/yyyy - HH:mm").format(time);
                        var img =
                            "${AppConstants.APP_BASE_URL}${data[index]["attributes"]["qr"]["data"]["attributes"]["url"]}";
                        var hospital =
                            data[index]["attributes"]["hospital"]["data"];
                        var name = "Chưa xác định";
                        var address = 'Chưa xác định';
                        if (hospital != null) {
                          name = hospital["attributes"]["Name"];
                          address = hospital["attributes"]["Address"];
                        }
                        data[index]["attributes"]["hospital"]["data"];
                        //  print(hospital);
                        return InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: ((context) => AlertDialog(
                                      content: Container(
                                        height: 430,
                                        width: 300,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CommonImageView(
                                                url: img, width: Get.width),
                                            SizedBox(
                                              child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                    text: "Tên bệnh viện: ",
                                                    style: AppStyle
                                                        .txtBeVietnamProSemiBold16
                                                        .copyWith(
                                                      color:
                                                          ColorConstant.gray800,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: name,
                                                    style: AppStyle
                                                        .txtBeVietnamProSemiBold16
                                                        .copyWith(
                                                      color:
                                                          ColorConstant.redA400,
                                                    ),
                                                  )
                                                ]),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            SizedBox(
                                              child: RichText(
                                                text: TextSpan(
                                                  //  style: TextStyle(height: 2),
                                                  children: [
                                                    TextSpan(
                                                      text: "Địa chỉ: ",
                                                      style: AppStyle
                                                          .txtBeVietnamProSemiBold14
                                                          .copyWith(
                                                        color: ColorConstant
                                                            .gray800,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: address,
                                                      style: AppStyle
                                                          .txtBeVietnamProLight12
                                                          .copyWith(
                                                        color: ColorConstant
                                                            .gray800,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            SizedBox(
                                              child: RichText(
                                                text: TextSpan(
                                                  //  style: TextStyle(height: 2),
                                                  children: [
                                                    TextSpan(
                                                      text: "Thời gian: ",
                                                      style: AppStyle
                                                          .txtBeVietnamProSemiBold14
                                                          .copyWith(
                                                        color: ColorConstant
                                                            .gray800,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: resultTime,
                                                      style: AppStyle
                                                          .txtBeVietnamProLight12
                                                          .copyWith(
                                                        color: ColorConstant
                                                            .gray800,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            SizedBox(
                                              child: RichText(
                                                text: TextSpan(
                                                  //  style: TextStyle(height: 2),
                                                  children: [
                                                    TextSpan(
                                                      text: "Nhóm máu: ",
                                                      style: AppStyle
                                                          .txtBeVietnamProSemiBold14
                                                          .copyWith(
                                                        color: ColorConstant
                                                            .gray800,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: data[index][
                                                                      "attributes"]
                                                                  [
                                                                  "blood_group"]
                                                              ["data"][
                                                          "attributes"]["name"],
                                                      style: AppStyle
                                                          .txtBeVietnamProLight12
                                                          .copyWith(
                                                        color: ColorConstant
                                                            .gray800,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              child: RichText(
                                                text: TextSpan(
                                                  //  style: TextStyle(height: 2),
                                                  children: [
                                                    TextSpan(
                                                      text: "Thể tích: ",
                                                      style: AppStyle
                                                          .txtBeVietnamProSemiBold14
                                                          .copyWith(
                                                        color: ColorConstant
                                                            .gray800,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          "${data[index]["attributes"]["capacity"]} ml",
                                                      style: AppStyle
                                                          .txtBeVietnamProLight12
                                                          .copyWith(
                                                        color: ColorConstant
                                                            .gray800,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )));
                          },
                          child: Container(
                            margin:
                                EdgeInsets.all(6).copyWith(left: 0, right: 0),
                            height: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(5, 4),
                                  spreadRadius: -4,
                                  blurRadius: 4,
                                  color: ColorConstant.red300,
                                ),
                              ],
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: "Tên bệnh viện: ",
                                          style: AppStyle
                                              .txtBeVietnamProSemiBold16
                                              .copyWith(
                                            color: ColorConstant.gray800,
                                          ),
                                        ),
                                        TextSpan(
                                          text: data[index]["attributes"]
                                                      ["hospital"]["data"] !=
                                                  null
                                              ? data[index]["attributes"]
                                                      ["hospital"]["data"]
                                                  ["attributes"]["Name"]
                                              : "",
                                          style: AppStyle
                                              .txtBeVietnamProSemiBold16
                                              .copyWith(
                                            color: ColorConstant.redA400,
                                          ),
                                        )
                                      ]),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  SizedBox(
                                    child: RichText(
                                      text: TextSpan(
                                        //  style: TextStyle(height: 2),
                                        children: [
                                          TextSpan(
                                            text: "Địa chỉ: ",
                                            style: AppStyle
                                                .txtBeVietnamProSemiBold14
                                                .copyWith(
                                              color: ColorConstant.gray800,
                                            ),
                                          ),
                                          TextSpan(
                                            text: data[index]["attributes"]
                                                        ["hospital"]["data"] !=
                                                    null
                                                ? data[index]["attributes"]
                                                        ["hospital"]["data"]
                                                    ["attributes"]["Address"]
                                                : "",
                                            style: AppStyle
                                                .txtBeVietnamProLight12
                                                .copyWith(
                                              color: ColorConstant.gray800,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  SizedBox(
                                    child: RichText(
                                      text: TextSpan(
                                        //  style: TextStyle(height: 2),
                                        children: [
                                          TextSpan(
                                            text: "Thời gian: ",
                                            style: AppStyle
                                                .txtBeVietnamProSemiBold14
                                                .copyWith(
                                              color: ColorConstant.gray800,
                                            ),
                                          ),
                                          TextSpan(
                                            text: resultTime,
                                            style: AppStyle
                                                .txtBeVietnamProLight12
                                                .copyWith(
                                              color: ColorConstant.gray800,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  SizedBox(
                                    child: RichText(
                                      text: TextSpan(
                                        //  style: TextStyle(height: 2),
                                        children: [
                                          TextSpan(
                                            text: "Nhóm máu: ",
                                            style: AppStyle
                                                .txtBeVietnamProSemiBold14
                                                .copyWith(
                                              color: ColorConstant.gray800,
                                            ),
                                          ),
                                          TextSpan(
                                            text: data[index]["attributes"]
                                                        ["hospital"]["data"] !=
                                                    null
                                                ? data[index]["attributes"]
                                                        ["hospital"]["data"]
                                                    ["attributes"]["Name"]
                                                : "",
                                            style: AppStyle
                                                .txtBeVietnamProLight12
                                                .copyWith(
                                              color: ColorConstant.gray800,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    child: RichText(
                                      text: TextSpan(
                                        //  style: TextStyle(height: 2),
                                        children: [
                                          TextSpan(
                                            text: "Thể tích: ",
                                            style: AppStyle
                                                .txtBeVietnamProSemiBold14
                                                .copyWith(
                                              color: ColorConstant.gray800,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                "${data[index]["attributes"]["capacity"]} ml",
                                            style: AppStyle
                                                .txtBeVietnamProLight12
                                                .copyWith(
                                              color: ColorConstant.gray800,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                onLoading: Center(
                  child: CircularProgressIndicator(),
                ),
                onError: ((error) => Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Có lỗi xảy ra, thử lại ?"),
                      ),
                    ))),
          ),
          Container(
            margin: EdgeInsets.all(16).copyWith(top: 20),
            child: controller.obx(
                (state) => ListView.builder(
                      itemCount: (state!.item2["data"] as List).length,
                      itemBuilder: ((context, index) {
                        var data = state.item2["data"] as List;
                        var time = DateTime.parse(
                            data[index]["attributes"]["timesign"]);
                        var resultTime =
                            DateFormat("dd/MM/yyyy - HH:mm").format(time);
                        var img = "";
                        if (data[index]["attributes"]["qr"]["data"] != null) {
                          img =
                              "${AppConstants.APP_BASE_URL}${data[index]["attributes"]["qr"]["data"]["attributes"]["url"]}";
                        }

                        var hospital =
                            data[index]["attributes"]["hospital"]["data"];
                        var name = "Chưa xác định";
                        var address = 'Chưa xác định';
                        if (hospital != null) {
                          name = hospital["attributes"]["Name"];
                          address = hospital["attributes"]["Address"];
                        }
                        data[index]["attributes"]["hospital"]["data"];
                        //  print(hospital);
                        return InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: ((context) => AlertDialog(
                                      content: Container(
                                        height: 430,
                                        width: 300,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CommonImageView(
                                              url: img,
                                              width: Get.width,
                                            ),
                                            SizedBox(
                                              child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                    text: "Tên bệnh viện: ",
                                                    style: AppStyle
                                                        .txtBeVietnamProSemiBold16
                                                        .copyWith(
                                                      color:
                                                          ColorConstant.gray800,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: name,
                                                    style: AppStyle
                                                        .txtBeVietnamProSemiBold16
                                                        .copyWith(
                                                      color:
                                                          ColorConstant.redA400,
                                                    ),
                                                  )
                                                ]),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            SizedBox(
                                              child: RichText(
                                                text: TextSpan(
                                                  //  style: TextStyle(height: 2),
                                                  children: [
                                                    TextSpan(
                                                      text: "Địa chỉ: ",
                                                      style: AppStyle
                                                          .txtBeVietnamProSemiBold14
                                                          .copyWith(
                                                        color: ColorConstant
                                                            .gray800,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: address,
                                                      style: AppStyle
                                                          .txtBeVietnamProLight12
                                                          .copyWith(
                                                        color: ColorConstant
                                                            .gray800,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            SizedBox(
                                              child: RichText(
                                                text: TextSpan(
                                                  //  style: TextStyle(height: 2),
                                                  children: [
                                                    TextSpan(
                                                      text: "Thời gian: ",
                                                      style: AppStyle
                                                          .txtBeVietnamProSemiBold14
                                                          .copyWith(
                                                        color: ColorConstant
                                                            .gray800,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: resultTime,
                                                      style: AppStyle
                                                          .txtBeVietnamProLight12
                                                          .copyWith(
                                                        color: ColorConstant
                                                            .gray800,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            SizedBox(
                                              child: RichText(
                                                text: TextSpan(
                                                  //  style: TextStyle(height: 2),
                                                  children: [
                                                    TextSpan(
                                                      text: "Nhóm máu: ",
                                                      style: AppStyle
                                                          .txtBeVietnamProSemiBold14
                                                          .copyWith(
                                                        color: ColorConstant
                                                            .gray800,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: data[index][
                                                                      "attributes"]
                                                                  [
                                                                  "blood_group"]
                                                              ["data"][
                                                          "attributes"]["name"],
                                                      style: AppStyle
                                                          .txtBeVietnamProLight12
                                                          .copyWith(
                                                        color: ColorConstant
                                                            .gray800,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              child: RichText(
                                                text: TextSpan(
                                                  //  style: TextStyle(height: 2),
                                                  children: [
                                                    TextSpan(
                                                      text: "Thể tích: ",
                                                      style: AppStyle
                                                          .txtBeVietnamProSemiBold14
                                                          .copyWith(
                                                        color: ColorConstant
                                                            .gray800,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          "${data[index]["attributes"]["capacity"]} ml",
                                                      style: AppStyle
                                                          .txtBeVietnamProLight12
                                                          .copyWith(
                                                        color: ColorConstant
                                                            .gray800,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )));
                          },
                          child: Container(
                            margin:
                                EdgeInsets.all(6).copyWith(left: 0, right: 0),
                            height: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(5, 4),
                                  spreadRadius: -4,
                                  blurRadius: 4,
                                  color: ColorConstant.red300,
                                ),
                              ],
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: "Tên bệnh viện: ",
                                          style: AppStyle
                                              .txtBeVietnamProSemiBold16
                                              .copyWith(
                                            color: ColorConstant.gray800,
                                          ),
                                        ),
                                        TextSpan(
                                          text: data[index]["attributes"]
                                                      ["hospital"]["data"] !=
                                                  null
                                              ? data[index]["attributes"]
                                                      ["hospital"]["data"]
                                                  ["attributes"]["Name"]
                                              : "",
                                          style: AppStyle
                                              .txtBeVietnamProSemiBold16
                                              .copyWith(
                                            color: ColorConstant.redA400,
                                          ),
                                        )
                                      ]),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  SizedBox(
                                    child: RichText(
                                      text: TextSpan(
                                        //  style: TextStyle(height: 2),
                                        children: [
                                          TextSpan(
                                            text: "Địa chỉ: ",
                                            style: AppStyle
                                                .txtBeVietnamProSemiBold14
                                                .copyWith(
                                              color: ColorConstant.gray800,
                                            ),
                                          ),
                                          TextSpan(
                                            text: data[index]["attributes"]
                                                        ["hospital"]["data"] !=
                                                    null
                                                ? data[index]["attributes"]
                                                        ["hospital"]["data"]
                                                    ["attributes"]["Address"]
                                                : "",
                                            style: AppStyle
                                                .txtBeVietnamProLight12
                                                .copyWith(
                                              color: ColorConstant.gray800,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  SizedBox(
                                    child: RichText(
                                      text: TextSpan(
                                        //  style: TextStyle(height: 2),
                                        children: [
                                          TextSpan(
                                            text: "Thời gian: ",
                                            style: AppStyle
                                                .txtBeVietnamProSemiBold14
                                                .copyWith(
                                              color: ColorConstant.gray800,
                                            ),
                                          ),
                                          TextSpan(
                                            text: resultTime,
                                            style: AppStyle
                                                .txtBeVietnamProLight12
                                                .copyWith(
                                              color: ColorConstant.gray800,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  SizedBox(
                                    child: RichText(
                                      text: TextSpan(
                                        //  style: TextStyle(height: 2),
                                        children: [
                                          TextSpan(
                                            text: "Nhóm máu: ",
                                            style: AppStyle
                                                .txtBeVietnamProSemiBold14
                                                .copyWith(
                                              color: ColorConstant.gray800,
                                            ),
                                          ),
                                          TextSpan(
                                            text: data[index]["attributes"]
                                                        ["hospital"]["data"] !=
                                                    null
                                                ? data[index]["attributes"]
                                                        ["hospital"]["data"]
                                                    ["attributes"]["Name"]
                                                : "",
                                            style: AppStyle
                                                .txtBeVietnamProLight12
                                                .copyWith(
                                              color: ColorConstant.gray800,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    child: RichText(
                                      text: TextSpan(
                                        //  style: TextStyle(height: 2),
                                        children: [
                                          TextSpan(
                                            text: "Thể tích: ",
                                            style: AppStyle
                                                .txtBeVietnamProSemiBold14
                                                .copyWith(
                                              color: ColorConstant.gray800,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                "${data[index]["attributes"]["capacity"]} ml",
                                            style: AppStyle
                                                .txtBeVietnamProLight12
                                                .copyWith(
                                              color: ColorConstant.gray800,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                onLoading: Center(
                  child: CircularProgressIndicator(),
                ),
                onError: ((error) => Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Có lỗi xảy ra, thử lại ?"),
                      ),
                    ))),
          ),
          Container(
            margin: EdgeInsets.all(16).copyWith(top: 20),
            child: controller.obx(
                (state) => ListView.builder(
                      itemCount: (state!.item3["data"] as List).length,
                      itemBuilder: ((context, index) {
                        var data = state.item3["data"] as List;
                        var time = DateTime.parse(
                            data[index]["attributes"]["timesign"]);
                        var resultTime =
                            DateFormat("dd/MM/yyyy - HH:mm").format(time);
                        var img =
                            "${AppConstants.APP_BASE_URL}${data[index]["attributes"]["qr"]["data"]["attributes"]["url"]}";
                        var hospital =
                            data[index]["attributes"]["hospital"]["data"];
                        var name = "Chưa xác định";
                        var address = 'Chưa xác định';
                        if (hospital != null) {
                          name = hospital["attributes"]["Name"];
                          address = hospital["attributes"]["Address"];
                        }
                        data[index]["attributes"]["hospital"]["data"];
                        //  print(hospital);
                        return InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: ((context) => AlertDialog(
                                      content: Container(
                                        height: 430,
                                        width: 300,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CommonImageView(url: img),
                                            SizedBox(
                                              child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                    text: "Tên bệnh viện: ",
                                                    style: AppStyle
                                                        .txtBeVietnamProSemiBold16
                                                        .copyWith(
                                                      color:
                                                          ColorConstant.gray800,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: name,
                                                    style: AppStyle
                                                        .txtBeVietnamProSemiBold16
                                                        .copyWith(
                                                      color:
                                                          ColorConstant.redA400,
                                                    ),
                                                  )
                                                ]),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            SizedBox(
                                              child: RichText(
                                                text: TextSpan(
                                                  //  style: TextStyle(height: 2),
                                                  children: [
                                                    TextSpan(
                                                      text: "Địa chỉ: ",
                                                      style: AppStyle
                                                          .txtBeVietnamProSemiBold14
                                                          .copyWith(
                                                        color: ColorConstant
                                                            .gray800,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: address,
                                                      style: AppStyle
                                                          .txtBeVietnamProLight12
                                                          .copyWith(
                                                        color: ColorConstant
                                                            .gray800,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            SizedBox(
                                              child: RichText(
                                                text: TextSpan(
                                                  //  style: TextStyle(height: 2),
                                                  children: [
                                                    TextSpan(
                                                      text: "Thời gian: ",
                                                      style: AppStyle
                                                          .txtBeVietnamProSemiBold14
                                                          .copyWith(
                                                        color: ColorConstant
                                                            .gray800,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: resultTime,
                                                      style: AppStyle
                                                          .txtBeVietnamProLight12
                                                          .copyWith(
                                                        color: ColorConstant
                                                            .gray800,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            SizedBox(
                                              child: RichText(
                                                text: TextSpan(
                                                  //  style: TextStyle(height: 2),
                                                  children: [
                                                    TextSpan(
                                                      text: "Nhóm máu: ",
                                                      style: AppStyle
                                                          .txtBeVietnamProSemiBold14
                                                          .copyWith(
                                                        color: ColorConstant
                                                            .gray800,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: data[index][
                                                                      "attributes"]
                                                                  [
                                                                  "blood_group"]
                                                              ["data"][
                                                          "attributes"]["name"],
                                                      style: AppStyle
                                                          .txtBeVietnamProLight12
                                                          .copyWith(
                                                        color: ColorConstant
                                                            .gray800,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              child: RichText(
                                                text: TextSpan(
                                                  //  style: TextStyle(height: 2),
                                                  children: [
                                                    TextSpan(
                                                      text: "Thể tích: ",
                                                      style: AppStyle
                                                          .txtBeVietnamProSemiBold14
                                                          .copyWith(
                                                        color: ColorConstant
                                                            .gray800,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          "${data[index]["attributes"]["capacity"]} ml",
                                                      style: AppStyle
                                                          .txtBeVietnamProLight12
                                                          .copyWith(
                                                        color: ColorConstant
                                                            .gray800,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )));
                          },
                          child: Container(
                            margin:
                                EdgeInsets.all(6).copyWith(left: 0, right: 0),
                            height: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(5, 4),
                                  spreadRadius: -4,
                                  blurRadius: 4,
                                  color: ColorConstant.red300,
                                ),
                              ],
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: "Tên bệnh viện: ",
                                          style: AppStyle
                                              .txtBeVietnamProSemiBold16
                                              .copyWith(
                                            color: ColorConstant.gray800,
                                          ),
                                        ),
                                        TextSpan(
                                          text: data[index]["attributes"]
                                                      ["hospital"]["data"] !=
                                                  null
                                              ? data[index]["attributes"]
                                                      ["hospital"]["data"]
                                                  ["attributes"]["Name"]
                                              : "",
                                          style: AppStyle
                                              .txtBeVietnamProSemiBold16
                                              .copyWith(
                                            color: ColorConstant.redA400,
                                          ),
                                        )
                                      ]),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  SizedBox(
                                    child: RichText(
                                      text: TextSpan(
                                        //  style: TextStyle(height: 2),
                                        children: [
                                          TextSpan(
                                            text: "Địa chỉ: ",
                                            style: AppStyle
                                                .txtBeVietnamProSemiBold14
                                                .copyWith(
                                              color: ColorConstant.gray800,
                                            ),
                                          ),
                                          TextSpan(
                                            text: data[index]["attributes"]
                                                        ["hospital"]["data"] !=
                                                    null
                                                ? data[index]["attributes"]
                                                        ["hospital"]["data"]
                                                    ["attributes"]["Address"]
                                                : "",
                                            style: AppStyle
                                                .txtBeVietnamProLight12
                                                .copyWith(
                                              color: ColorConstant.gray800,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  SizedBox(
                                    child: RichText(
                                      text: TextSpan(
                                        //  style: TextStyle(height: 2),
                                        children: [
                                          TextSpan(
                                            text: "Thời gian: ",
                                            style: AppStyle
                                                .txtBeVietnamProSemiBold14
                                                .copyWith(
                                              color: ColorConstant.gray800,
                                            ),
                                          ),
                                          TextSpan(
                                            text: resultTime,
                                            style: AppStyle
                                                .txtBeVietnamProLight12
                                                .copyWith(
                                              color: ColorConstant.gray800,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  SizedBox(
                                    child: RichText(
                                      text: TextSpan(
                                        //  style: TextStyle(height: 2),
                                        children: [
                                          TextSpan(
                                            text: "Nhóm máu: ",
                                            style: AppStyle
                                                .txtBeVietnamProSemiBold14
                                                .copyWith(
                                              color: ColorConstant.gray800,
                                            ),
                                          ),
                                          TextSpan(
                                            text: data[index]["attributes"]
                                                        ["hospital"]["data"] !=
                                                    null
                                                ? data[index]["attributes"]
                                                        ["hospital"]["data"]
                                                    ["attributes"]["Name"]
                                                : "",
                                            style: AppStyle
                                                .txtBeVietnamProLight12
                                                .copyWith(
                                              color: ColorConstant.gray800,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    child: RichText(
                                      text: TextSpan(
                                        //  style: TextStyle(height: 2),
                                        children: [
                                          TextSpan(
                                            text: "Thể tích: ",
                                            style: AppStyle
                                                .txtBeVietnamProSemiBold14
                                                .copyWith(
                                              color: ColorConstant.gray800,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                "${data[index]["attributes"]["capacity"]} ml",
                                            style: AppStyle
                                                .txtBeVietnamProLight12
                                                .copyWith(
                                              color: ColorConstant.gray800,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                onLoading: Center(
                  child: CircularProgressIndicator(),
                ),
                onError: ((error) => Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Có lỗi xảy ra, thử lại ?"),
                      ),
                    ))),
          ),
        ]),
      ),
    );
  }
}
