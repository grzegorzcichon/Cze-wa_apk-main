import '../model/c6h6_model.dart';
import 'C6H6-provider.dart';

class C6H6Repository {
  final _provider = C6H6Provider();

  Future<C6H6Model> fetchC6H6List() {
    return _provider.fetchC6H6List();
  }
}

class NetworkError extends Error {}
