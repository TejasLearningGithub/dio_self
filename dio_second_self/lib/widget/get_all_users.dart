import 'package:dio/dio.dart';
import 'package:dio_second_self/model/user.dart';
import 'package:dio_second_self/utils/dio_client.dart';
import 'package:flutter/material.dart';

class GetAllUsers extends StatefulWidget {
  const GetAllUsers({super.key});

  @override
  State<GetAllUsers> createState() => _GetAllUsersState();
}

class _GetAllUsersState extends State<GetAllUsers> {
  List<User> listUser = [];
  var _dioClient = DioClient();
  var _dio = Dio();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Get All Data'),
        ),
        body: ListView.builder(
            itemCount: listUser.length,
            itemBuilder: (context, index) {
              return Column(
                children: [Text(getAllUsers().toString())],
              );
            }));
  }

  getAllUsers() async {
    //List<User?> getAll = [];

    try {
      final response = await _dio.get('https://reqres.in/api/users/');
      print(response.data.toString());
      var getAll = response.data as List;
      listUser = getAll.map((e) => User.fromJson(e)).toList();
      
    } on DioError catch (e) {
      if (e.response != null) {
        print('DIO ERRORS');
        print('HEADERS = ${e.response?.headers}');
        print('STATUS = ${e.response?.statusCode}');
        print('Data = ${e.response?.data}');
      } else {
        print(e.message);
      }
    }
    return listUser;
  }
}
