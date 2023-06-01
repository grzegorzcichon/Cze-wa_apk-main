import '../model/NO2_model.dart';
import 'O3-provider.dart';

class O3Repository {
  final _provider = O3Provider();

  Future<NO2Model> fetchO3List() {
    return _provider.fetchO3List();
  }
}

class NetworkError extends Error {}
