import 'package:dio_second_self/model/album.dart';
import 'package:dio_second_self/provider/update_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateData extends StatefulWidget {
  const UpdateData({super.key});

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  var _idController = TextEditingController();
  var _userIdController = TextEditingController();
  var _titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var myUpdateProvider = Provider.of<MyUpdateProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Data'),
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
              decoration: InputDecoration(hintText: 'Enter User Id'),
            ),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(hintText: 'Enter Title'),
            ),
            ElevatedButton(
              onPressed: () {
                Album? userInfo = Album(
                  id: int.parse(_idController.text),
                  userId: int.parse(_userIdController.text),
                  title: _titleController.text,
                );
                myUpdateProvider.updateData(userInfo, _idController.text);
              },
              child: Text(
                'Update User',
              ),
            ),
            Consumer<MyUpdateProvider>(builder: (context, value, child) {
              return Column(
                children: [
                  Text(value.res?.id.toString() ?? 'not updated'),
                  Text(value.res?.userId.toString() ?? 'not updated'),
                  Text(value.res?.title ?? 'not updated'),
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
