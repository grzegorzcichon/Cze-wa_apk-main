import '../model/co_model.dart';
import 'CO-provider.dart';

class CORepository {
  final _provider = COProvider();

  Future<COModel> fetchCOList() {
    return _provider.fetchCOList();
  }
}

class NetworkError1 extends Error {}
