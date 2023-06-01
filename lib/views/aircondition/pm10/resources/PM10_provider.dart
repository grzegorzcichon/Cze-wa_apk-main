import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../model/PM10_model.dart';

class PM10Provider {
  final Dio _dio = Dio();
  final String _url = 'https://api.gios.gov.pl/pjp-api/rest/data/getData/5256';

  Future<PM10Model> fetchNO2List() async {
    try {
      Response response = await _dio.get(_url);
      return PM10Model.fromJson((response.data));
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occured: $error stackTrace: $stacktrace");
      }
      return PM10Model.withError("Data not found / Connection issue");
    }
  }
}
