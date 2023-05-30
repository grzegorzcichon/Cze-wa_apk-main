import '../model/SO2_model.dart';
import 'SO2-provider.dart';

class SO2Repository {
  final _provider = SO2Provider();

  Future<SO2Model> fetchSO2List() {
    return _provider.fetchSO2List();
  }
}

class NetworkError extends Error {}
