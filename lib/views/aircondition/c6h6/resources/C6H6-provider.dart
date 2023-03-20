import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../model/c6h6_model.dart';

class C6H6Provider {
  final Dio _dio = Dio();
  final String _url = 'https://api.gios.gov.pl/pjp-api/rest/data/getData/14913';

  Future<C6H6Model> fetchCovidList() async {
    try {
      Response response = await _dio.get(_url);
      return C6H6Model.fromJson((response.data));
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occured: $error stackTrace: $stacktrace");
      }
      return C6H6Model.withError("Data not found / Connection issue");
    }
  }
}
