import 'package:bloodapp2/core/app_export.dart';
import 'package:bloodapp2/data/apiClient/api_client.dart';
import 'package:bloodapp2/data/models/news_model.dart';
import 'package:bloodapp2/presentation/home_index_screen/models/home_index_model.dart';
import 'package:tuple/tuple.dart';

class HomeIndexController extends GetxController
    with StateMixin<Tuple2<NewResponse, dynamic>> {
  Rx<HomeIndexModel> homeIndexModelObj = HomeIndexModel().obs;
  //Rx<NewEventModel> newEventModel = HomeIndexModel().obs;
  Rx<int> silderIndex = 0.obs;
  Rx<bool> isLoading = true.obs;
  Rx<Object> events = Object().obs;
  Rx<Object> isLoadingEvent = true.obs;

  var newResponse = NewResponse().obs;

  /// It calls the ApiClient class and the getListNew method.
  Future<void> getNews() async {
    change(null, status: RxStatus.loading());

    /// Calling the ApiClient class and the getListNew method.
    try {
      var newResponse = await ApiClient()
          .getListNew("${AppConstants.APP_BASE_URL}/api/blogs?populate=*");
      var eventResponse = await ApiClient()
          .getListEvent("${AppConstants.APP_BASE_URL}/api/events?populate=*");
      change(Tuple2(newResponse, eventResponse), status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
    //change(Tuple2(MyModel(), [MyCompleteModel()]), );
  }

  @override
  Future<void> onInit() async {
    getNews();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    print("Ready");
  }

  @override
  void onClose() {
    super.onClose();
  }
}
