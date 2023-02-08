import 'package:bloodapp2/presentation/home_index_screen/models/new_model.dart';
import 'package:bloodapp2/presentation/home_index_screen/widgets/home_new_screen.dart';
import 'package:bloodapp2/presentation/profile_index_screen/profile_index_screen.dart';
import 'package:bloodapp2/presentation/profile_login_screen/controller/profile_login_controller.dart';
import 'package:bloodapp2/presentation/profile_login_screen/profile_login_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../blooddonation_register_one_screen/blooddonation_register_one_screen.dart';
import '../scan_qr/scan_qr_screen.dart';
import 'widgets/home_event_slide.dart';
import 'controller/home_index_controller.dart';
import 'models/slide_event_home.dart';
import 'package:bloodapp2/core/app_export.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class HomeIndexScreen extends GetView<HomeIndexController> {
  var _page = 0.obs;
  var _index = 0.obs;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  void _onRefresh() async {
    controller.getNews();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    print("loading");
    _refreshController.loadComplete();
  }

  final controllerUser = Get.put(ProfileLoginController());
  @override
  Widget build(BuildContext context) {
    //ModelEventSlide

    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          switch (_page.value) {
            case 0:
              return Text("Trang chủ");
            case 1:
              return Text(controllerUser.auth.value == false
                  ? "Đăng nhập"
                  : "Đăng ký hiến máu");
            case 2:
              return Text("Cài đặt");
            default:
              return Text("Chức năng không tồn tại");
          }
        }),
        actions: [
          Obx(() {
            print('log nè');

            dynamic state = controllerUser.roles.value;
            //  print(state == Object());
            print(state);
            if (state != null) {
              return state == "Hospital"
                  ? IconButton(
                      onPressed: () {
                        Get.to(QRScanScreen());
                      },
                      icon: Icon(Icons.qr_code),
                    )
                  : Container();
            }
            return Container();
          })
        ],
        backgroundColor: ColorConstant.redA200,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        key: _bottomNavigationKey,
        backgroundColor: ColorConstant.redA200,
        color: Colors.white,
        items: <Widget>[
          Icon(
            Icons.home_outlined,
            size: 30,
            color: ColorConstant.redA200,
          ),
          Container(
            // color: Colors.red,
            child: SvgPicture.asset(
              ImageConstant.imgDashboard,
              width: 30,
              height: 30,
              color: ColorConstant.redA200,
            ),
          ),
          Icon(
            Icons.account_circle_outlined,
            size: 30,
            color: ColorConstant.redA200,
          ),
        ],
        onTap: (index) {
          //setState(() {

          _page(index);
          //  });
        },
      ),
      backgroundColor: ColorConstant.whiteA700,
      body: Obx(() {
        switch (_page.value) {
          case 0:
            return SmartRefresher(
              // header: WaterDropHeader(),
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              enablePullDown: true,
              enablePullUp: true,
              controller: _refreshController,
              child: SingleChildScrollView(
                child: controller.obx(
                    (state) => Column(
                          children: [
                            Align(
                              // alignment: Alignment.centerLeft,
                              child: Container(
                                  // height: getVerticalSize(839.00),
                                  width: size.width,
                                  child: Stack(children: [
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          height: getVerticalSize(77.00),
                                          width: size.width,
                                          margin: getMargin(bottom: 10),
                                          decoration: BoxDecoration(
                                              color: ColorConstant.redA200),
                                        )),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Padding(
                                          padding: getPadding(
                                            left: 20,
                                            top: 30,
                                            right: 20,
                                          ),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                    decoration: AppDecoration
                                                        .outlineGray200
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder6),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 18,
                                                                      top: 10,
                                                                      bottom:
                                                                          10),
                                                              child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Align(
                                                                        alignment:
                                                                            Alignment
                                                                                .center,
                                                                        child: Padding(
                                                                            padding:
                                                                                getPadding(left: 5, right: 5),
                                                                            child: CommonImageView(imagePath: ImageConstant.imgImage2, height: getSize(50.00), width: getSize(50.00)))),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            top:
                                                                                9),
                                                                        child: Text(
                                                                            "lbl_10_t_nh_th_nh"
                                                                                .tr,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: AppStyle.txtBeVietnamProRegular10))
                                                                  ])),
                                                          Container(
                                                              height:
                                                                  getVerticalSize(
                                                                      20.00),
                                                              width:
                                                                  getHorizontalSize(
                                                                      1.00),
                                                              margin: getMargin(
                                                                  top: 36,
                                                                  bottom: 36),
                                                              decoration:
                                                                  BoxDecoration(
                                                                      color: ColorConstant
                                                                          .gray200)),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      top: 10,
                                                                      bottom:
                                                                          9),
                                                              child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            left:
                                                                                18,
                                                                            right:
                                                                                18),
                                                                        child: CommonImageView(
                                                                            imagePath:
                                                                                ImageConstant.imgImage4,
                                                                            height: getSize(50.00),
                                                                            width: getSize(50.00))),
                                                                    Align(
                                                                        alignment:
                                                                            Alignment
                                                                                .centerLeft,
                                                                        child: Padding(
                                                                            padding:
                                                                                getPadding(top: 10),
                                                                            child: Text("msg_1k_t_nh_nguy_n_vi_n".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtBeVietnamProRegular10)))
                                                                  ])),
                                                          Container(
                                                              height:
                                                                  getVerticalSize(
                                                                      20.00),
                                                              width:
                                                                  getHorizontalSize(
                                                                      1.00),
                                                              margin: getMargin(
                                                                  top: 36,
                                                                  bottom: 36),
                                                              decoration:
                                                                  BoxDecoration(
                                                                      color: ColorConstant
                                                                          .gray200)),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      top: 10,
                                                                      right: 13,
                                                                      bottom:
                                                                          9),
                                                              child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            left:
                                                                                9,
                                                                            right:
                                                                                10),
                                                                        child: CommonImageView(
                                                                            imagePath:
                                                                                ImageConstant.imgImage3,
                                                                            height: getSize(50.00),
                                                                            width: getSize(50.00))),
                                                                    Align(
                                                                        alignment:
                                                                            Alignment
                                                                                .centerLeft,
                                                                        child: Padding(
                                                                            padding:
                                                                                getPadding(top: 10),
                                                                            child: Text("lbl_10k_n_v_m_u".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtBeVietnamProRegular10)))
                                                                  ]))
                                                        ])),
                                                Padding(
                                                    padding:
                                                        getPadding(top: 29),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      top: 1),
                                                              child: Text(
                                                                  "msg_c_n_m_u_kh_n_c_p"
                                                                      .tr,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtBeVietnamProSemiBold14)),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      bottom:
                                                                          2),
                                                              child: Text(
                                                                  "lbl_chi_ti_t"
                                                                      .tr,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtBeVietnamProRegular12))
                                                        ])),
                                                Container(
                                                    margin: getMargin(top: 10),
                                                    decoration: AppDecoration
                                                        .fillGray50,
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 10,
                                                                      top: 9,
                                                                      bottom:
                                                                          10),
                                                              child: Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            bottom:
                                                                                1),
                                                                        child: Text(
                                                                            "lbl_1"
                                                                                .tr,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: AppStyle.txtBeVietnamProRegular12Gray800)),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            left:
                                                                                25,
                                                                            top:
                                                                                1),
                                                                        child: Text(
                                                                            "msg_b_nh_vi_n_th_nh"
                                                                                .tr,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: AppStyle.txtBeVietnamProRegular12Gray800))
                                                                  ])),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      top: 9,
                                                                      right: 10,
                                                                      bottom:
                                                                          10),
                                                              child: Text(
                                                                  "lbl_a".tr,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtBeVietnamProRegular12))
                                                        ])),
                                                Align(
                                                    alignment: Alignment.center,
                                                    child: Padding(
                                                        padding: getPadding(
                                                            left: 10,
                                                            top: 9,
                                                            right: 10),
                                                        child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            bottom:
                                                                                1),
                                                                        child: Text(
                                                                            "lbl_2"
                                                                                .tr,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: AppStyle.txtBeVietnamProRegular12Gray800)),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            left:
                                                                                22,
                                                                            top:
                                                                                1),
                                                                        child: Text(
                                                                            "msg_b_nh_vi_n_a_khoa"
                                                                                .tr,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: AppStyle.txtBeVietnamProRegular12Gray800))
                                                                  ]),
                                                              Padding(
                                                                  padding:
                                                                      getPadding(
                                                                          top:
                                                                              1,
                                                                          bottom:
                                                                              1),
                                                                  child: Text(
                                                                      "lbl_b_o"
                                                                          .tr,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: AppStyle
                                                                          .txtBeVietnamProRegular12))
                                                            ]))),
                                                Container(
                                                    margin: getMargin(top: 9),
                                                    decoration: AppDecoration
                                                        .fillGray50,
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 10,
                                                                      top: 9,
                                                                      bottom:
                                                                          9),
                                                              child: Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            bottom:
                                                                                1),
                                                                        child: Text(
                                                                            "lbl_3"
                                                                                .tr,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: AppStyle.txtBeVietnamProRegular12Gray800)),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            left:
                                                                                22,
                                                                            top:
                                                                                1),
                                                                        child: Text(
                                                                            "msg_b_nh_vi_n_c_a_ng"
                                                                                .tr,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: AppStyle.txtBeVietnamProRegular12Gray800))
                                                                  ])),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      top: 10,
                                                                      right: 10,
                                                                      bottom:
                                                                          9),
                                                              child: Text(
                                                                  "lbl_ab_b".tr,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtBeVietnamProRegular12))
                                                        ])),
                                                Padding(
                                                    padding:
                                                        getPadding(top: 30),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                              "msg_s_ki_n_hi_n_m_u"
                                                                  .tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtBeVietnamProSemiBold14),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      top: 1,
                                                                      bottom:
                                                                          1),
                                                              child: Text(
                                                                  "lbl_xem_th_m"
                                                                      .tr,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtBeVietnamProRegular12))
                                                        ])),
                                                //SlideEventApp
                                                Padding(
                                                    padding: getPadding(top: 9),
                                                    child:
                                                        CarouselSlider.builder(
                                                            options:
                                                                CarouselOptions(
                                                                    height: getVerticalSize(
                                                                        108.00),
                                                                    initialPage:
                                                                        0,
                                                                    autoPlay:
                                                                        true,
                                                                    viewportFraction:
                                                                        1.0,
                                                                    enableInfiniteScroll:
                                                                        false,
                                                                    scrollDirection:
                                                                        Axis
                                                                            .horizontal,
                                                                    onPageChanged:
                                                                        (index,
                                                                            reason) {
                                                                      _index(
                                                                          index);
                                                                    }),
                                                            itemCount: (state
                                                                            ?.item2[
                                                                        "data"]
                                                                    as List<
                                                                        dynamic>)
                                                                .length,
                                                            itemBuilder:
                                                                (context, index,
                                                                    realIndex) {
                                                              var data = state
                                                                          ?.item2[
                                                                      "data"][index]
                                                                  [
                                                                  "attributes"];
                                                              var time =
                                                                  DateTime
                                                                      .parse(
                                                                data[
                                                                    "StartTime"],
                                                              ).format();
                                                              var type = data["status"]
                                                                          [
                                                                          "data"]
                                                                      [
                                                                      "attributes"]
                                                                  [
                                                                  "StatusName"];
                                                              var content = data[
                                                                  "content"];
                                                              var desc = data[
                                                                  "Description"];
                                                              ModelEventSlide model =
                                                                  ModelEventSlide(
                                                                      title: data[
                                                                          "EventName"],
                                                                      path:
                                                                          "${AppConstants.APP_BASE_URL}${data["avatar"]["data"]["attributes"]["url"]}",
                                                                      time:
                                                                          time,
                                                                      type:
                                                                          type,
                                                                      content:
                                                                          content,
                                                                      description:
                                                                          desc);

                                                              return SliderNewEvent(
                                                                  model);
                                                            })),
                                                Obx(() {
                                                  return Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Container(
                                                        height: getVerticalSize(
                                                            4.00),
                                                        margin: getMargin(
                                                            left: 10,
                                                            top: 10,
                                                            right: 10),
                                                        child: AnimatedSmoothIndicator(
                                                            activeIndex: _index
                                                                .value,
                                                            count: (state?.item2[
                                                                        "data"]
                                                                    as List<
                                                                        dynamic>)
                                                                .length,
                                                            axisDirection: Axis
                                                                .horizontal,
                                                            effect: ScrollingDotsEffect(
                                                                spacing: 6,
                                                                activeDotColor:
                                                                    ColorConstant
                                                                        .redA400,
                                                                dotColor:
                                                                    ColorConstant
                                                                        .gray400,
                                                                dotHeight:
                                                                    getVerticalSize(
                                                                        4.00),
                                                                dotWidth:
                                                                    getHorizontalSize(
                                                                        4.00))),
                                                      ));
                                                }),
                                                Padding(
                                                    padding:
                                                        getPadding(top: 29),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text("lbl_tin_t_c".tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtBeVietnamProSemiBold14),
                                                          Padding(
                                                            padding: getPadding(
                                                                top: 1,
                                                                bottom: 1),
                                                            child: Text(
                                                                "lbl_xem_th_m"
                                                                    .tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtBeVietnamProRegular12),
                                                          ),
                                                        ])),
                                              ])),
                                    ),
                                  ])),
                            ),
                            // ignore: unrelated_type_equality_checks
                            Container(
                              height: 500,
                              child: ListView(
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  ...(state?.item1.data?.map((e) {
                                    var time = DateTime.parse(e
                                            .attributes!.publishedAt
                                            .toString())
                                        .format();
                                    return Container(
                                        padding:
                                            getPadding(left: 20, right: 20),
                                        child: HomeEventNew(
                                          newEventModel: NewEventModel(
                                            content:
                                                e.attributes!.content as String,
                                            title:
                                                e.attributes!.title as String,
                                            decription: e.attributes!
                                                .description as String,
                                            lastTimePublic: time,
                                            path:
                                                '${AppConstants.APP_BASE_URL}${e.attributes!.avatar?.data!.attributes!.url as String}',
                                          ),
                                        ));
                                  }))!
                                      .toList()
                                ],
                              ),
                            ),
                          ],
                        ),
                    onLoading: Container(
                      child: Center(child: CircularProgressIndicator()),
                      height: Get.height,
                    ),
                    onError: ((error) => Text(error ?? ""))),
              ),
            );
          case 1:
            if (controllerUser.auth.value == true) {
              return BlooddonationRegisterOneScreen();
            } else {
              return LoginScreen();
            }
          case 2:
            if (controllerUser.auth.value == true) {
              return ProfileIndexScreen();
            } else {
              return LoginScreen();
            }
          //return ProfileIndexScreen();
          default:
            return Center(child: Text("Chức năng không tồn tại"));
        }
      }),
    );
  }

  onTapIconBlood() {
    Get.toNamed(AppRoutes.blooddonationLoginwarningScreen);
  }
}
