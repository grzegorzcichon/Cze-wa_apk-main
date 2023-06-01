import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../model/o3_model.dart';

class O3Provider {
  final Dio _dio = Dio();
  final String _url = 'https://api.gios.gov.pl/pjp-api/rest/data/getData/5253';

  Future<COModel> fetchO3List() async {
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
