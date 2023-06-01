import '../model/PM10_model.dart';
import 'NO2_provider.dart';

class NO2Repository {
  final _provider = PM10Provider();

  Future<PM10Model> fetchNO2List() {
    return _provider.fetchNO2List();
  }
}

class NetworkError extends Error {}
