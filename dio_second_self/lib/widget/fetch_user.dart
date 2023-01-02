import 'package:dio_second_self/model/album.dart';
import 'package:dio_second_self/model/user.dart';
import 'package:dio_second_self/utils/dio_client.dart';
import 'package:flutter/material.dart';

class FetchUser extends StatefulWidget {
  const FetchUser({super.key});

  @override
  State<FetchUser> createState() => _FetchUserState();
}

class _FetchUserState extends State<FetchUser> {
  TextEditingController _idController = TextEditingController();
  final DioClient _client = DioClient();

  bool _isFetching = false;
  bool _isDeleting = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetching Single User'),
      ),
      body: Container(
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _idController,
                decoration: InputDecoration(
                  hintText: 'Enter ID',
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            _isFetching
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _isFetching = true;
                      });

                      Album? user =
                          await _client.getUser(id: _idController.text);

                      if (user != null &&
                          user.id! ==
                              int.parse(_idController.text.toString())) {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Data Fetched'),
                                Text(user.id.toString()),
                                Text(user.title ?? 'no data'),
                                Text(user.userId.toString()),
                                //Text(user.data?.email ?? 'no data'),
                              ],
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'User not found',
                            ),
                          ),
                        );
                      }
                      setState(() {
                        _isFetching = false;
                      });
                    },
                    child: Text('Fetch'))
          ],
        ),
      ),
    );
  }
}
