import 'package:MultiCal/app/constant/enum/request_language_enum.dart';
import 'package:MultiCal/app/data_sources/local/cache_manager.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioProvider with CacheManager {
  static const String baseUrl = "BuildConfig.instance.config.baseUrl";
  static const String chatBaseUrl = "BuildConfig.instance.config.chatBaseUrl";
  static Dio? _instance;

  static const int _maxLineWidth = 90;
  static final _prettyDioLogger = PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: _maxLineWidth);

  static final BaseOptions _options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 60 * 1000,
      receiveTimeout: 60 * 1000,
      headers: _addHeader());

  static Dio get httpDio {
    if (_instance == null) {
      _instance = Dio(_options);
      _addHeader();
      _instance!.interceptors.add(_prettyDioLogger);
      return _instance!;
    } else {
      _addHeader();
      _instance!.interceptors.clear();
      _instance!.interceptors.add(_prettyDioLogger);
      return _instance!;
    }
  }

  ///returns a Dio client with Access token in header
  ///Also adds a token refresh interceptor which retry the request when it's unauthorized
  static Dio get dioWithHeaderToken {
    _addInterceptors();
    _addHeader();
    return _instance!;
  }

  static _addHeader() {
    // String? authToken;
    // var prefData =
    //     Get.find<CacheManager>().getString(CacheManagerKey.loginResponseData) ??
    //         "";
    // if (prefData.isNotEmpty) {
    //   Map<String, dynamic> loginUserData = jsonDecode(prefData);
    //   var user = LoginResponse.fromJson(loginUserData);
    //   authToken = user.accessToken;
    // }
    _instance?.options.headers = {
      "Content-Type": Headers.jsonContentType,
      "Content-language": LanguageEnums.ENGLISH.languageCode,
      "apikey": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNoYW9xeWZ6YnlpZGRzdHdxZ3FkIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU2MTA3MTUsImV4cCI6MjAxMTE4NjcxNX0.lARagk_WOt7KBfP5xuWKU1n8dM1N8FVIaUnB3xyLvtQ",
      // "Authorization":
      // "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNoYW9xeWZ6YnlpZGRzdHdxZ3FkIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU2MTA3MTUsImV4cCI6MjAxMTE4NjcxNX0.lARagk_WOt7KBfP5xuWKU1n8dM1N8FVIaUnB3xyLvtQ" + (authToken != null ? KeyGenerator.decrypt(authToken) : "")
    };
  }

  static _addInterceptors() {
    _instance ??= httpDio;
    _instance!.interceptors.clear();
    _instance!.interceptors.add(_prettyDioLogger);
  }
}

