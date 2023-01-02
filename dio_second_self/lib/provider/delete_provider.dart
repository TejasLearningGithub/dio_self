import 'package:dio_second_self/model/album.dart';
import 'package:dio_second_self/utils/dio_client.dart';
import 'package:flutter/cupertino.dart';

class MyDeleteProvider with ChangeNotifier {
  var _dioClient = DioClient();

  Album? res;
  Album? get myAlbum => res;

  Future<Album?> deleteData({required int id}) async {
    var res = await _dioClient.deleteData(id: id);
    notifyListeners();
    return res;
  }
}
