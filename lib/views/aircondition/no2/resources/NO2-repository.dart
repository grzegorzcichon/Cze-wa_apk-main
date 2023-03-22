import '../model/NO2_model.dart';
import 'NO2-provider.dart';

class NO2Repository {
  final _provider = NO2Provider();

  Future<NO2Model> fetchNO2List() {
    return _provider.fetchNO2List();
  }
}

class NetworkError1 extends Error {}
