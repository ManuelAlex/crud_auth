import 'dart:convert';
import 'dart:developer';
import 'package:crud_auth/models/user_model.dart';

import 'package:crud_auth/const/api_const';
import 'package:http/http.dart' as http;

class ApiServicesAuth {
  Future<http.Response> postData({
    required data,
    required String apiUrlEndpoint,
  }) async {
    var url = Uri.http(ApiConstants.baseUrl + apiUrlEndpoint);
    return await http.post(url, body: jsonEncode(data), headers: _setHeaders());
  }

  Future<http.Response> getData({
    required String apiUrlEndpoint,
  }) async {
    var url = Uri.http(ApiConstants.baseUrl + apiUrlEndpoint);
    return await http.get(url, headers: _setHeaders());
  }

  _setHeaders() =>
      {'Content-Type': 'application/json', 'Accept': 'application/json'};

  Future<String> createUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
  }) async {
    String res = 'some Error Occured';
    var data = jsonEncode(UserModel(
        useriId: phone,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        email: email,
        password: password));
    try {
      var response = await postData(
          apiUrlEndpoint: ApiConstants.createUserEndpoint, data: data);
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        if (body['ok']) {
          res = 'success';
        }
      }
    } catch (e) {
      log(e.toString());
    }
    return res;
  }

  Future<bool> verifyUser() async {
    var response =
        await getData(apiUrlEndpoint: ApiConstants.verifyUserEndpoint);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> deleteUser() async {
    var response =
        await getData(apiUrlEndpoint: ApiConstants.deleteUsersEndpoint);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = 'some Error Occured';
    var data = {'email': email, 'password': password};
    try {
      var response = await postData(
          apiUrlEndpoint: ApiConstants.loginUsersEndpoint, data: data);
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        if (body['ok']) {
          res = 'success';
        }
      }
    } catch (e) {
      log(e.toString());
    }
    return res;
  }

  Future<String> getUserProfileById({
    required String phone,
  }) async {
    String res = 'some Error Occured';
    var data = {
      'phone': phone,
    };
    try {
      var response = await postData(
          apiUrlEndpoint: ApiConstants.userProfileEndpoint, data: data);
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        if (body['ok']) {
          res = 'success';
        }
      }
    } catch (e) {
      log(e.toString());
    }
    return res;
  }

  Future<String> editUserId({
    required String phone,
  }) async {
    String res = 'some Error Occured';
    var data = {
      'phone': phone,
    };
    try {
      var response = await postData(
          apiUrlEndpoint: ApiConstants.editUsersAvatarEndpoint, data: data);
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        if (body['ok']) {
          res = 'success';
        }
      }
    } catch (e) {
      log(e.toString());
    }
    return res;
  }
}
