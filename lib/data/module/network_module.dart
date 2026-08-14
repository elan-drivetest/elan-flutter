import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:elan/core/endpoints/api_endpoints.dart';
import 'package:elan/data/interceptor/cookie_refresh_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';


@module
abstract class NetworkModule {
  @preResolve
  Future<PersistCookieJar> get cookieJar async {
    final dir = await getApplicationDocumentsDirectory();
    return PersistCookieJar(storage: FileStorage("${dir.path}/cookies"));
  }

  @lazySingleton
  CookieRefreshInterceptor cookieInterceptor(PersistCookieJar jar) =>
      CookieRefreshInterceptor(jar);

  @lazySingleton
  Dio dio(
      PersistCookieJar cookieJar,
      CookieRefreshInterceptor interceptor,
      ) {
    final dio = Dio(BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: const Duration(seconds: 50),
      receiveTimeout: const Duration(seconds: 50),
      contentType: "application/json",
    ));

    dio.interceptors.addAll([
      CookieManager(cookieJar),
      interceptor,
    ]);

    // bind the dio instance to the interceptor after creation
    interceptor.bindDio(dio);

    return dio;
  }
}


