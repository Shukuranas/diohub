import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:onehub/app/Dio/dio.dart';
import 'package:onehub/app/keys.dart';
import 'package:onehub/models/authentication/access_token_model.dart';
import 'package:onehub/models/authentication/device_code_model.dart';

class AuthService {
  static final String _url = '/login/';
  static final _storage = new FlutterSecureStorage();

  static Future<bool> isAuthenticated() async {
    var token = await _storage.read(key: 'accessToken');
    debugPrint('Auth token ${token ?? 'not found.'}');
    if (token != null) {
      return true;
    }
    return false;
  }

  static void storeAccessToken(AccessTokenModel accessTokenModel) async {
    await _storage.write(
        key: "accessToken", value: accessTokenModel.accessToken);
    await _storage.write(key: 'scope', value: accessTokenModel.scope);
  }

  static Future<String> getAccessTokenFromDevice() async {
    String accessToken = await _storage.read(key: "accessToken");
    if (accessToken != null) {
      return accessToken;
    }
    //Todo: Router
    // ExtendedNavigator.named('rootNav').replace(Routes.loginScreen);
    return null;
  }

  static Future<Response> getDeviceToken() async {
    FormData formData = FormData.fromMap({
      'client_id': PrivateKeys.clientID,
      'scope': _scope,
    });
    var response = await GetDio.getDio(
            loggedIn: false,
            baseURL: 'https://github.com/',
            loginRequired: false)
        .post("${_url}device/code", data: formData);
    return response;
  }

  static String _scope =
      'repo repo:status repo_deployment public_repo repo:invite '
      'security_events admin:repo_hook write:repo_hook read:repo_hook admin:org'
      ' write:org read:org admin:public_key write:public_key read:public_key '
      'admin:org_hook gist user read:user user:email user:follow '
      'delete_repo write:discussion read:discussion write:packages read:packages'
      ' delete:packages admin:gpg_key write:gpg_key read:gpg_key workflow';

  static Future<Response> getAccessToken({String deviceCode}) async {
    FormData formData = FormData.fromMap({
      'client_id': PrivateKeys.clientID,
      'device_code': deviceCode,
      'grant_type': 'urn:ietf:params:oauth:grant-type:device_code',
    });
    Response response = await GetDio.getDio(
            loggedIn: false,
            loginRequired: false,
            baseURL: 'https://github.com/',
            debugLog: false,
            buttonLock: false)
        .post("${_url}oauth/access_token", data: formData);
    if (response.data['access_token'] != null) {
      storeAccessToken(AccessTokenModel.fromJson(response.data));
      return response;
    } else if (response.data['error'] == 'incorrect_device_code') {
      throw Exception(response.data['error_description']);
    }
    return response;
  }

  Future<DeviceCodeModel> getDeviceCode() async {
    await AuthService.getDeviceToken().then((value) {
      if (value.data['device_code'] != null) {
        return DeviceCodeModel.fromJson(value.data);
      }
    });
    //Exception is thrown if the response does not contain device_code.
    throw Exception('Some error occurred.');
  }

  static void logOut() async {
    await _storage.deleteAll();
  }
}
