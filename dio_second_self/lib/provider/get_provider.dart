import 'package:dio_second_self/model/album.dart';
import 'package:dio_second_self/utils/dio_client.dart';
import 'package:flutter/cupertino.dart';

class MyGetProvider with ChangeNotifier {
  var _dioClient = DioClient();
  Album? res;
  Album? get myAlbum => res;

  Future<Album?> getData(String id) async {
    res = await _dioClient.getUser(id: id);
    notifyListeners();
    return res;
  }
}
