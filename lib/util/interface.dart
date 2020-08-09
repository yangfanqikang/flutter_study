import 'package:dio/dio.dart';

Future request(String baseURL, String url, {formData, method = 'GET'}) async {
  var requestId = new DateTime.now();
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.baseUrl = baseURL;
    dio.options.receiveTimeout = 50000;
    dio.options.headers['Content-Type'] = 'application/json';

    dio.interceptors.add(
      InterceptorsWrapper(onRequest: (RequestOptions options) async {
        print("${requestId.toString()}：地址：${dio.options.baseUrl}" + url);
        print("${requestId.toString()}：header：${dio.options.headers}");
        if (formData != null) {
          print("${requestId.toString()}：参数：" + formData.toString());
        }
      }, onResponse: (Response response) {
        print("${requestId.toString()}：响应结果：" + response.toString());
        return response;
      }),
    );

    if (formData == null) {
      response = await dio.request(url, options: Options(method: method));
    } else {
      response = await dio.request(url,
          data: formData, options: Options(method: method));
    }

    if (response.statusCode == 200) {
      return response.data;
    } else {
      print('出错啦~~~~~~~~~~~~~~~~~~~~~~~~~${response.statusCode}');
    }
  } on DioError catch (e) {
    print('网络加载失败了，-----------${e.message}');
  } finally {}
}
