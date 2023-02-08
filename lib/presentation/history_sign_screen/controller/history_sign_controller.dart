import 'package:bloodapp2/data/apiClient/api_client.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

class HistorySignController extends GetxController
    with StateMixin<Tuple3<dynamic, dynamic, dynamic>> {
  void fetchData() async {
    try {
      var finish = await ApiClient().getHistory();
      var registed = await ApiClient().getHistory(type: "REGISTER");
      var cancel = await ApiClient().getHistory(type: "CANCEL");
      //  print(cancel);
      // print(registed);
      change(Tuple3(finish, registed, cancel), status: RxStatus.success());
    } catch (e) {
      print(e);
      change(Tuple3(null, null, null), status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }
}
