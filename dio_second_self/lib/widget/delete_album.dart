import 'package:dio_second_self/utils/dio_client.dart';
import 'package:flutter/material.dart';

class DeleteAlbum extends StatefulWidget {
  const DeleteAlbum({super.key});

  @override
  State<DeleteAlbum> createState() => _DeleteAlbumState();
}

class _DeleteAlbumState extends State<DeleteAlbum> {
  var _dioClient = DioClient();
  var _idController = TextEditingController();
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: _idController,
              decoration: InputDecoration(hintText: 'Enter ID'),
            ),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      var deletedData = await _dioClient.deleteData(
                          id: int.parse(_idController.text));

                      setState(() {
                        _isLoading = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Album Deleted ${deletedData?.title ?? 'title deleted'}',
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Delete Data',
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
