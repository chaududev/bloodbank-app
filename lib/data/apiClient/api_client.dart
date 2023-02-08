import 'dart:convert';
import 'package:bloodapp2/core/app_export.dart';
import 'package:bloodapp2/data/models/news_model.dart';
import 'package:bloodapp2/data/models/user_info_stored_model.dart';
import 'package:bloodapp2/presentation/profile_login_screen/controller/profile_login_controller.dart';
import 'package:bloodapp2/presentation/profile_login_screen/models/profile_login_model.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  /// The above function is used to get the list of news from the API.
  ///
  /// @param String path The path to the API endpoint.
  ///
  /// @return NewResponse
  Future<NewResponse> getListNew(String path) async {
    var response = await http.get(Uri.parse(path));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var dataResponse = NewResponse.fromJson(json);
      return dataResponse;
    } else {
      return NewResponse();
    }
  }

  Future<Object> getListEvent(String path) async {
    var response = await http.get(Uri.parse(path));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      //  var dataResponse = NewResponse.fromJson(json);
      return json;
    } else {
      return new Object();
    }
  }

  Future<dynamic> getByPath(String path) async {
    var response = await http.get(Uri.parse(path));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      //  var dataResponse = NewResponse.fromJson(json);
      return json;
    } else {
      return new Object();
    }
  }

  Future<UserInfoStored> login(PayLoadLogin payLoadLogin) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('${AppConstants.APP_BASE_URL}/api/auth/local'));
    request.body = json.encode({
      "identifier": "${payLoadLogin.identifier}",
      "password": "${payLoadLogin.password}"
    });
    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      return UserInfoStored.fromJson(
          jsonDecode(await response.stream.bytesToString()));
    } else {
      throw Exception("Account or password not found");
    }
  }

  Future<UserInfoStored> register(payload) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('${AppConstants.APP_BASE_URL}/api/auth/local/register'));
    request.body = json.encode({
      "username": payload["username"],
      "email": payload["email"],
      "password": payload["password"]
    });
    request.headers.addAll(headers);

    var response = await request.send();

    try {
      if (response.statusCode == 200) {
        return UserInfoStored.fromJson(
            jsonDecode(await response.stream.bytesToString()));
      }
      throw Exception("Register Fail");
    } catch (e) {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<dynamic> getMe(String token) async {
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request('GET',
        Uri.parse('${AppConstants.APP_BASE_URL}/api/users/me?populate=deep,4'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var json = await response.stream.bytesToString();
      return jsonDecode(json);
    } else {
      throw Exception(response.reasonPhrase);
      //print(response.reasonPhrase);
    }
  }

  Future<dynamic> getHistory({String type = "FINISHED"}) async {
    ProfileLoginController controller = Get.find();
    var headers = {'Authorization': 'Bearer ${controller.userObjs.value.jwt}'};
    var request = http.Request(
        'GET',
        Uri.parse(
            '${AppConstants.APP_BASE_URL}/api/form-signs?populate=deep,3&filters[register][users_permissions_user][id]=${controller.userObjs.value.user!.id}&filters[register][status_register][name]=$type'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var json = await response.stream.bytesToString();
      //    print(json);
      return jsonDecode(json);
    } else {
      throw Exception(response.reasonPhrase);
      //print(response.reasonPhrase);
    }
  }

  Future<dynamic> signBlood(dynamic data, String token) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    //  print(token);
    var request = http.Request('POST',
        Uri.parse('${AppConstants.APP_BASE_URL}/api/registers?populate=*'));
    var dataSend = {
      "data": {
        "note": data["note"] ?? "",
        "users_permissions_user": data["user_id"].toString(),
        "status_register": 1,
        //  "user_register": "",
        "blood_group": data["blood_group"] ?? 1
      }
    };
    // print(dataSend);
    request.body = json.encode(dataSend);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    //print(request.body);

    try {
      if (response.statusCode == 200) {
        var result = await response.stream.bytesToString();
        var send = jsonDecode(result);
        var dataSend = {
          "register": send["data"]["id"],
          "blood_group": data["blood_group"] ?? 1
        };
        await registerForm(dataSend, token);
        return send;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<dynamic> cancelSign(dynamic data, String token) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    //  print(token);
    var request = http.Request(
        'PUT',
        Uri.parse(
            '${AppConstants.APP_BASE_URL}/api/registers/${data['id']}?populate=*'));
    var dataSend = {
      "data": {
        "note": data["note"] ?? "",
        "users_permissions_user": data["user_id"].toString(),
        "status_register": 5,
        //  "user_register": "",
        "blood_group": data["blood_group"] ?? 1
      }
    };
    // print(dataSend);
    request.body = json.encode(dataSend);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    //print(request.body);

    try {
      if (response.statusCode == 200) {
        var result = await response.stream.bytesToString();
        return jsonDecode(result);
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<dynamic> registerForm(dynamic data, String token) async {
    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'POST', Uri.parse('${AppConstants.APP_BASE_URL}/api/form-signs'));
    request.body = json.encode({
      "data": {
        "url": "",
        "timesign": DateTime.now().toString(),
        "register": data["register"],
        "capacity": "0",
        "blood_group": data["blood_group"],
      }
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<dynamic> getInfoFormSignByID(String id) async {
    ProfileLoginController controller = Get.find();
    var headers = {'Authorization': 'Bearer ${controller.userObjs.value.jwt}'};
    var request = http.Request(
        'GET',
        Uri.parse(
            '${AppConstants.APP_BASE_URL}/api/form-signs/$id?populate=deep,4'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var dataResponse = await response.stream.bytesToString();
      return jsonDecode(dataResponse);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<dynamic> getAllHospital() async {
    ProfileLoginController controller = Get.find();
    var headers = {'Authorization': 'Bearer ${controller.userObjs.value.jwt}'};
    var request = http.Request(
        'GET', Uri.parse('https://eztadmin.xyz/api/hopitals?populate'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var dataResponse = await response.stream.bytesToString();
      return jsonDecode(dataResponse);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<dynamic> updateFormSign(
      String capicity, String hospital, String idForm) async {
    ProfileLoginController controller = Get.find();
    //  var headers = {'Authorization': 'Bearer ${controller.userObjs.value.jwt}'};
    var headers = {
      'Authorization': 'Bearer ${controller.userObjs.value.jwt}',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'PUT',
        Uri.parse(
            '${AppConstants.APP_BASE_URL}/api/form-signs/$idForm?populate=deep,3'));
    request.body = json.encode({
      "data": {"capacity": capicity, "hospital": hospital}
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var dataResponse = await response.stream.bytesToString();
      var data = jsonDecode(dataResponse);
      var id = data["data"]["attributes"]["register"]["data"]["id"].toString();
      print(id);
      UpdateRegister(id, controller.userObjs.value.jwt.toString());
      return data;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<dynamic> UpdateRegister(String id, String token) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    //  print(token);
    var request = http.Request('PUT',
        Uri.parse('${AppConstants.APP_BASE_URL}/api/registers/$id?populate=*'));
    var dataSend = {
      "data": {
        "status_register": 4,
        //  "user_register": "",
      }
    };
    // print(dataSend);
    request.body = json.encode(dataSend);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    //print(request.body);

    try {
      if (response.statusCode == 200) {
        var result = await response.stream.bytesToString();
        return jsonDecode(result);
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<dynamic> UpdateAccountUser(String id, data) async {
    ProfileLoginController controller = Get.find();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${controller.userObjs.value.jwt}',
    };
    //  print(token);
    var request = http.Request('PUT',
        Uri.parse('${AppConstants.APP_BASE_URL}/api/users/$id?populate=*'));
    var dataSend = {
      "FullName": data["fullname"],
      "gender": data["gender"],
      "address": data["address"],
      "PhoneNumber": data['PhoneNumber'],
      "DateofBirth": data['DateofBirth'],
      "blood_group": data["blood_group"],
    };
    print(dataSend);
    request.body = json.encode(dataSend);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    //print(request.body);

    try {
      if (response.statusCode == 200) {
        var result = await response.stream.bytesToString();
        return jsonDecode(result);
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
//http://localhost:1337/api/registers?populate=%2A&filters[users_permissions_user][id]=1