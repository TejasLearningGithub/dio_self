import 'package:dio_second_self/model/album.dart';
import 'package:dio_second_self/provider/create_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateData extends StatefulWidget {
  const CreateData({super.key});

  @override
  State<CreateData> createState() => _CreateDataState();
}

class _CreateDataState extends State<CreateData> {
  bool _isLoading = false;
  var _idController = TextEditingController();
  var _userIdController = TextEditingController();
  var _titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<MyCreateProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Data'),
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
                      Album? userInfo = Album(
                          id: int.parse(_idController.text),
                          userId: int.parse(_userIdController.text),
                          title: _titleController.text);
                      myProvider.createData(userInfo, _idController.text);
                      setState(() {
                        _isLoading = false;
                      });
                    },
                    child: Text(
                      'Create User',
                    ),
                  ),
            Consumer<MyCreateProvider>(builder: (context, value, child) {
              return Column(
                children: [
                  Text('User Created'),
                  Text(context.read<MyCreateProvider>().res?.id.toString() ??
                      ''),
                  Text(
                      context.read<MyCreateProvider>().res?.userId.toString() ??
                          ''),
                  Text(context.read<MyCreateProvider>().res?.title ?? ''),
                  Text(
                    context.read<MyCreateProvider>().res != null
                        ? 'User Created'
                        : 'User not created',
                  )
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
