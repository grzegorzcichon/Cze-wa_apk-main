import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../model/SO2_model.dart';

class SO2Provider {
  final Dio _dio = Dio();
  final String _url = 'https://api.gios.gov.pl/pjp-api/rest/data/getData/5260';

  Future<SO2Model> fetchSO2List() async {
    try {
      Response response = await _dio.get(_url);
      return SO2Model.fromJson((response.data));
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occured: $error stackTrace: $stacktrace");
      }
      return SO2Model.withError("Data not found / Connection issue");
    }
  }
}
