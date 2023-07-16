import 'package:dio/dio.dart';
import 'package:pokedex/core/utils.dart';

class NetworkManager {
  final Dio dio;

  NetworkManager._(this.dio);

  factory NetworkManager() {
    final dio = Dio();
    return NetworkManager._(dio);
  }

  Future<Response<T>> request<T>(
    RequestMethod method,
    String url, {
    data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) {
    return dio.request(url,
        data: data,
        queryParameters: queryParameters,
        options: Options(method: method.value, headers: headers));
  }
}

enum RequestMethod {
  get,
  head,
  post,
  put,
  delete,
  connect,
  options,
  trace,
  patch,
}

extension RequestMethodX on RequestMethod {
  String get value => getEnumValue(this).toUpperCase();
}

class NetworkConstants {
  static String baseUrl = "https://pokeapi.co/api/v2";

  static String pokemon = "$baseUrl/pokemon/";
  static String moveByName = "move/{name}";
}
