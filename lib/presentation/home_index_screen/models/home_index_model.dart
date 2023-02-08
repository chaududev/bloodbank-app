import 'package:bloodapp2/presentation/home_index_screen/models/new_model.dart';
import 'package:get/get.dart';
import 'slide_event_home.dart';

class HomeIndexModel {
  var listModelSlide = [
    ModelEventSlide(
        time: "20/11/2022",
        title: "Ngày hội hiến máu",
        type: "Đang diễn ra",
        path:
            "https://cdn.pixabay.com/photo/2018/08/14/13/23/ocean-3605547__340.jpg"),
    ModelEventSlide(
        time: "20/11/2022",
        title: "Ngày hội hiến máu lần 2",
        type: "Đang diễn ra",
        path:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQhx3dcZ1s0esng4AWzPxtcjou7wDuE7rQtw&usqp=CAU"),
  ].obs;
  // var listModelNew = [
  //   NewEventModel(

  //       title: 'Phẫu thuật thành công cho bệnh nhân nhờ nguồn máu kịp thời',
  //       path:
  //           "https://cdn.pixabay.com/photo/2018/08/14/13/23/ocean-3605547__340.jpg",
  //       lastTimePublic: "5 phút trước",
  //       decription:
  //           "Arcu nisi, convallis nec dictum. Sit est, risus at etiam et urna odio lorem."),
  // ].obs;
}
