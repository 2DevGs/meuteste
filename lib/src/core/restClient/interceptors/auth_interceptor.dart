import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_imobi_brasil/src/core/constants/local_storage_keys.dart';
import 'package:teste_imobi_brasil/src/core/ui/imobi_nav_global_key.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final RequestOptions(:headers, :extra) = options;
    const authHeaderKey = 'Authorization';
    headers.remove(authHeaderKey);
    if (extra case {'DIO_AUTH_KEY': true}) {
      final sp = await SharedPreferences.getInstance();
      headers.addAll({
        authHeaderKey:
            'Bearer ${sp.getString((LocalStorageKeys.internalAccessToken))}'
      });
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final DioException(requestOptions: RequestOptions(:extra), :response) = err;

    if (extra case {'DIO_AUTH_KEY': true}) {
      if (response != null && response.statusCode == HttpStatus.forbidden) {
        Navigator.of(ImobiNavGlobalKey.instance.navKey.currentContext!)
            .pushNamedAndRemoveUntil('/auth/login', (route) => false);
      }
    }
    handler.reject(err);
  }
}
