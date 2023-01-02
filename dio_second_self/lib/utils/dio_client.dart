import 'package:dio/dio.dart';
import 'package:dio_second_self/model/album.dart';
import 'package:dio_second_self/model/user.dart';
import 'package:dio_second_self/model/user_info.dart';
import 'package:dio_second_self/utils/Logging.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  ))
    ..interceptors.add(Logging());

  Future<Album?> getUser({required String id}) async {
    Album? user;

    try {
      Response userData = await _dio.get('/albums/$id');
      print('user info = ${userData.data}');
      user = Album.fromJson(userData.data);
    } on DioError catch (e) {
      if (e.response != null) {
        print('DIO ERROR');
        print('Status = ${e.response?.statusMessage}');
        print('DATA=${e.response?.data}');
        print('HEADERS=${e.response?.headers}');
      } else {
        print('Error Sending Request');
        print(e.message);
      }
    }
    return user;
  }

  Future<Album?> updateUser({
    required Album userInfo,
    required String id,
  }) async {
    Album? updatedUser;
    try {
      Response response = await _dio.put(
        '/albums/$id',
        data: userInfo.toJson(),
      );

      print('User Updated:${response.data}');
      updatedUser = Album.fromJson(response.data);
    } on DioError catch (e) {
      print('Error Updating user = ${e.toString()}');
    }
    return updatedUser;
  }

  Future<Album?> createUser({required Album albumInfo}) async {
    Album? myNewAlbum;
    try {
      Response response = await _dio.post(
        '/albums',
        data: albumInfo.toJson(),
      );
      print('Album Created = ${response.data}');
      myNewAlbum = Album.fromJson(response.data);
    } on DioError catch (e) {
      print('Status code = ${e.response?.statusCode}');
      print('Error message = ${e.response?.statusMessage}');
    }
    return myNewAlbum;
  }

  Future<Album?> deleteData({required int id}) async {
    Album? deletedAlbum;
    try {
      Response response = await _dio.delete('/albums/$id');
      deletedAlbum = Album.fromJson(response.data);
    } on DioError catch (e) {
      print(e.toString());
    }
    return deletedAlbum;
  }
}
