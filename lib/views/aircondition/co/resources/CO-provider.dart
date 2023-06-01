import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../model/co_model.dart';

class COProvider {
  final Dio _dio = Dio();
  final String _url = 'https://api.gios.gov.pl/pjp-api/rest/data/getData/5246';

  Future<COModel> fetchCOList() async {
    try {
      Response response = await _dio.get(_url);
      return COModel.fromJson((response.data));
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occured: $error stackTrace: $stacktrace");
      }
      return COModel.withError("Data not found / Connection issue");
    }
  }
}
