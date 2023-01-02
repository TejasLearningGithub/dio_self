import 'package:dio_second_self/model/album.dart';
import 'package:dio_second_self/utils/dio_client.dart';
import 'package:flutter/material.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  var _idController = TextEditingController();
  var _userIdController = TextEditingController();
  var _titleController = TextEditingController();
  bool _isLoading = false;
  var _dioClient = DioClient();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create User'),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: _idController,
              decoration: InputDecoration(hintText: 'Enter ID'),
            ),
            TextField(
              controller: _userIdController,
              decoration: InputDecoration(hintText: 'Enter User ID'),
            ),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(hintText: 'Enter Title'),
            ),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });

                      Album myAlbumInfo = Album(
                          id: int.parse(
                            _idController.text.toString(),
                          ),
                          userId: int.parse(_userIdController.text.toString()),
                          title: _titleController.text);

                      var myAlbum =
                          await _dioClient.createUser(albumInfo: myAlbumInfo);
                      if (myAlbum != null) {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('User Created'),
                                Text(myAlbum.id.toString()),
                                Text(myAlbum.userId.toString()),
                                Text(myAlbum.title ?? 'no title'),
                              ],
                            ),
                          ),
                        );
                      }
                      setState(() {
                        _isLoading = false;
                      });
                    },
                    child: Text(
                      'Create User',
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
