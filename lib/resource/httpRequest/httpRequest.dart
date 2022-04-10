import 'package:dio/dio.dart';

class RequestInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    return super.onError(err, handler);
  }
}

class HttpRequest {
  static late final Dio dio;

  CancelToken _cancelToken = new CancelToken();

  HttpRequest([BaseOptions? baseOptions]) {
    if (baseOptions == null) {
      baseOptions = BaseOptions(
          baseUrl: 'http://192.168.8.100:3000/',
          receiveTimeout: 5000,
          connectTimeout: 5000);
    }
    dio = Dio(baseOptions);
    dio.interceptors.add(RequestInterceptor());
  }

  Future get(String path,
      {queryParameters, Options? options, CancelToken? cancelToken}) async {
    return await dio.get(path,
        queryParameters: queryParameters,
        options: options ?? Options(),
        cancelToken: cancelToken ?? this._cancelToken);
  }
}

HttpRequest httpRequest = new HttpRequest();
