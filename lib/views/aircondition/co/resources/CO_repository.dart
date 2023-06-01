import '../model/o3_model.dart';
import 'O3-provider.dart';

class O3Repository {
  final _provider = O3Provider();

  Future<COModel> fetchO3List() {
    return _provider.fetchO3List();
  }
}

class NetworkError extends Error {}
