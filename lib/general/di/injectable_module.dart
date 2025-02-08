import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  Dio dio() {
    final dio = Dio();

    dio.options = BaseOptions(
      baseUrl: 'alpha.bytesdelivery.com/api/v3',
    );

    return dio;
  }
}