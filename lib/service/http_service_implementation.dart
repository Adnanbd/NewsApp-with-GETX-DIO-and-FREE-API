import 'package:dio/dio.dart';
import 'package:getx_dio_sample_project/service/http_service.dart';

const BASE_URL = "https://newsapi.org";
const API_KEY = "6ae7fbd2cc4742b3bb83b7c5aca11201";

class HttpServiceImpl implements HttpService {
  late Dio _dio;

  @override
  Future<Response> getReq(String url) async {
    // TODO: implement getReq

    Response response;
    try {
      print("Start 1 => $url");
      response = await _dio.get(url);
      print("Mid 1 =>");
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (e, handler) {
          print(e.message);
          handler.next(e);
        },
        onRequest: (request, handler) {
          print(
              "${request.method} | ${request.path} | ${request.baseUrl} | ${request.headers}");
          handler.next(request);
        },
        onResponse: (r, handler) {
          print("${r.statusCode}");
          print("${r.statusMessage}");
          print("${r.data}");
          handler.next(r);
        },
      ),
    );
  }

  @override
  void init() {
    // TODO: implement init

    _dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        headers: {
          "Authorization": "Bearer $API_KEY",
        },
      ),
    );
    initializeInterceptors();
  }
}
