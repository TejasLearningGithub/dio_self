import 'package:dio_second_self/model/album.dart';
import 'package:dio_second_self/model/user_info.dart';
import 'package:dio_second_self/utils/dio_client.dart';
import 'package:flutter/material.dart';

class UpdateUser extends StatefulWidget {
  const UpdateUser({super.key});

  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  var _idController = TextEditingController();
  var _titleController = TextEditingController();
  var _jobController = TextEditingController();

  var _dioClient = DioClient();
  bool _isUpdating = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update User',
        ),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: _idController,
              decoration: InputDecoration(hintText: 'Enter ID'),
            ),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(hintText: 'Enter name'),
            ),
            TextField(
              controller: _jobController,
              decoration: InputDecoration(hintText: 'Enter job'),
            ),
            _isUpdating
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _isUpdating = true;
                      });

                      if (_titleController.text != '' &&
                          _jobController.text != '') {
                        Album? _userInfo = Album(
                          title: _titleController.text,
                        );
                        Album? retrivedUser = await _dioClient.updateUser(
                            userInfo: _userInfo,
                            id: _idController.text.toString());

                        if (retrivedUser != null) {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(retrivedUser.title ?? 'not updated')
                                ],
                              ),
                            ),
                          );
                        }
                      }
                      setState(() {
                        _isUpdating = false;
                      });
                    },
                    child: Text(
                      'Update User',
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
