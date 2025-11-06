import 'dart:convert';
import 'dart:io';
import 'package:anmol_marketing/core/data/network_manager/prints.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

Dio getDio() {
  Dio dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
    ),
  );

  // Add HTTP adapter configuration for better connection handling
  dio.httpClientAdapter = IOHttpClientAdapter(
    createHttpClient: () {
      final client = HttpClient();
      client.idleTimeout = const Duration(seconds: 30);
      client.connectionTimeout = const Duration(seconds: 30);
      return client;
    },
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        printValue(tag: 'API URL:', '${options.uri}');
        printValue(tag: 'HEADER:', options.headers);
        try {
          printValue(tag: 'REQUEST BODY:', jsonEncode(options.data));
        } catch (e) {
          printValue(tag: "Request Body", e.toString());
        }
        return handler.next(options);
      },

      onResponse: (Response response, ResponseInterceptorHandler handler) {
        printValue(tag: 'API RESPONSE:', response.data);
        return handler.next(response);
      },

      onError: (DioException e, ErrorInterceptorHandler handler) async {
        printValue(tag: 'STATUS CODE:', "${e.response?.statusCode ?? ""}");
        printValue(tag: 'ERROR DATA:', "${e.response?.data ?? ""}");

        // 👇 Retry once if it's a connection issue or timeout
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.connectionError ||
            e.type == DioExceptionType.receiveTimeout) {
          try {
            printValue(tag: "RETRY", "Retrying request with fresh Dio...");
            final retryDio = Dio(
              BaseOptions(
                connectTimeout: const Duration(seconds: 10),
                sendTimeout: const Duration(seconds: 10),
                receiveTimeout: const Duration(seconds: 10),
                contentType: "application/json",
                responseType: ResponseType.json,
              ),
            );
            final cloneReq = await retryDio.request(
              e.requestOptions.path,
              data: e.requestOptions.data,
              queryParameters: e.requestOptions.queryParameters,
              options: Options(
                method: e.requestOptions.method,
                headers: e.requestOptions.headers,
              ),
            );

            return handler.resolve(cloneReq);
          } catch (retryErr) {
            return handler.next(e);
          }
        }

        return handler.next(e);
      },
    ),
  );

  return dio;
}
