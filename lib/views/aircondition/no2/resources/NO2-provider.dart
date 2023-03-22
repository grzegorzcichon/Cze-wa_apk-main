import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../model/NO2_model.dart';

class NO2Provider {
  final Dio _dio = Dio();
  final String _url = 'https://api.gios.gov.pl/pjp-api/rest/data/getData/5250';

  Future<NO2Model> fetchNO2List() async {
    try {
      Response response = await _dio.get(_url);
      return NO2Model.fromJson((response.data));
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occured: $error stackTrace: $stacktrace");
      }
      return NO2Model.withError("Data not found / Connection issue");
    }
  }
}
