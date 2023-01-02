import 'package:dio_second_self/model/album.dart';
import 'package:dio_second_self/utils/dio_client.dart';
import 'package:flutter/cupertino.dart';

class MyCreateProvider with ChangeNotifier {
  final _dioClient = DioClient();
  Album? res;
  Album? get myData => res;
  Future<Album?> createData(Album userInfo, String id) async {
    res = await _dioClient.updateUser(userInfo: userInfo, id: id);
    notifyListeners();
    return res;
  }
}
