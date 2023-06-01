import '../model/pm10_model.dart';
import 'PM10-provider.dart';

class PM10Repository {
  final _provider = PM10Provider();

  Future<PM10Model> fetchPM10List() {
    return _provider.fetchPM10List();
  }
}

class NetworkError extends Error {}
