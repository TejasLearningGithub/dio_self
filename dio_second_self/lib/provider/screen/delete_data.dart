import 'package:dio_second_self/provider/delete_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeleteData extends StatefulWidget {
  const DeleteData({super.key});

  @override
  State<DeleteData> createState() => _DeleteDataState();
}

class _DeleteDataState extends State<DeleteData> {
  var _idController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var deleteModel = context.read<MyDeleteProvider>();
    var myDeleteProvider =
        Provider.of<MyDeleteProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Data'),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: _idController,
              decoration: InputDecoration(
                hintText: 'Enter ID',
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  myDeleteProvider.deleteData(
                    id: int.parse(_idController.text),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          '${myDeleteProvider.res?.id ?? 'Data Has Been Deleted'} ${myDeleteProvider.res?.title ?? ''}'),
                    ),
                  );
                },
                child: Text('Delete Data')),
            Consumer<MyDeleteProvider>(builder: ((context, value, child) {
              return Column(
                children: [
                  Text(deleteModel.res?.id.toString() ?? ''),
                  Text(
                      context.read<MyDeleteProvider>().res?.userId.toString() ??
                          ''),
                  Text(context.read<MyDeleteProvider>().res?.title ?? ''),
                ],
              );
            }))
          ],
        ),
      ),
    );
  }
}
