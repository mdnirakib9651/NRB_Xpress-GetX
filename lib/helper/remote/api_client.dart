import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' as Foundation;
import 'package:get/get.dart';
import 'package:merchant/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'exception.dart';

class ApiClient extends GetConnect implements GetxService {
  final String appBaseUrl;
  final SharedPreferences sharedPreferences;

  String? token;
  Map<String, String>? _mainHeaders;

  ApiClient({required this.appBaseUrl, required this.sharedPreferences}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = sharedPreferences.getString(AppConstants.token);
    // debugPrint('Token: $token');
    _mainHeaders = {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }


  Future<Response> getData(
    String uri, {
    Map<String, dynamic>? query,
    String? contentType,
    Map<String, String>? headers,
    Function(dynamic)? decoder,
  }) async {
    try {
      if (Foundation.kDebugMode) {
         debugPrint('====> GetX Call: $uri\nToken: $token');
      }
      DateTime time = DateTime.now();
      var loggerRespRcvTime = time.millisecondsSinceEpoch;
      Response response = await get(
        uri,
        contentType: contentType,
        query: query,
        headers: headers ?? _mainHeaders,
        decoder: decoder,
      );

      response = handleResponse(response);
      if (Foundation.kDebugMode) {
        debugPrint(
            '====> GetX Response: [${response.statusCode}] $uri\n${response.body}');
        debugPrint(
            '====> GetX Response: [$_mainHeaders] $uri\n${response.body}');
      }
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(
    String uri,
    dynamic body, {
    Map<String, dynamic>? query,
    String? contentType,
    Map<String, String>? headers,
    Function(dynamic)? decoder,
    Function(double)? uploadProgress,
  }) async {
    try {
      if (Foundation.kDebugMode) {
        debugPrint('====> GetX Call: $uri\nToken: $token');
        debugPrint('====> GetX Body: $body');
      }

      DateTime time = DateTime.now();
      var loggerRespRcvTime = time.millisecondsSinceEpoch;
      Response response = await post(
        uri,
        body,
        query: query,
        contentType: contentType,
        headers: headers ?? _mainHeaders,
        decoder: decoder,
        uploadProgress: uploadProgress,
      );

      response = handleResponse(response);
      if (Foundation.kDebugMode) {
        debugPrint(
            '====> GetX Response: [${response.statusCode}] $uri\n${response.body}');
      }
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> putData(
    String uri,
    dynamic body, {
    Map<String, dynamic>? query,
    String? contentType,
    Map<String, String>? headers,
    Function(dynamic)? decoder,
    Function(double)? uploadProgress,
  }) async {
    try {
      if (Foundation.kDebugMode) {
        // debugPrint('====> GetX Call: $uri\nToken: $token');
        debugPrint('====> GetX Body: $body');
      }
      Response response = await put(
        uri,
        body,
        query: query,
        contentType: contentType,
        headers: headers ?? _mainHeaders,
        decoder: decoder,
        uploadProgress: uploadProgress,
      );
      response = handleResponse(response);
      if (Foundation.kDebugMode) {
        debugPrint(
            '====> GetX Response: [${response.statusCode}] $uri\n${response.body}');
      }
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> deleteData(
    String uri, {
    Map<String, dynamic>? query,
    String? contentType,
    Map<String, String>? headers,
    Function(dynamic)? decoder,
  }) async {
    try {
      if (Foundation.kDebugMode) {
        // debugPrint('====> GetX Call: $uri\nToken: $token');
      }
      Response response = await delete(
        uri,
        headers: headers ?? _mainHeaders,
        contentType: contentType,
        query: query,
        decoder: decoder,
      );
      response = handleResponse(response);
      if (Foundation.kDebugMode) {
        debugPrint(
            '====> GetX Response: [${response.statusCode}] $uri\n${response.body}');
      }
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  void updateHeader(String? token){
    _mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Response handleResponse(Response response) {
    Response _response = response;
    if (_response.hasError &&
        _response.body != null &&
        _response.body is! String) {
      if (_response.body.toString().startsWith('{errors: [{code:')) {
        ErrorClass _errorResponse = ErrorClass.fromJson(_response.body);
        _response = Response(
            statusCode: _response.statusCode,
            body: _response.body,
            statusText: _errorResponse.errors![0].message);
      } else if (_response.body.toString().startsWith('{message')) {
        _response = Response(
            statusCode: _response.statusCode,
            body: _response.body,
            statusText: _response.body['message']);
      }
    } else if (_response.hasError && _response.body == null) {
      _response = const Response(
          statusCode: 0,
          statusText:
              'Connection to API server failed due to internet connection');
    }
    return _response;
  }
}
