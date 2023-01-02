import 'package:dio_second_self/provider/get_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetData extends StatefulWidget {
  const GetData({super.key});

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  var _idController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var myGetProvider = Provider.of<MyGetProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Single Data'),
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
                  myGetProvider.getData(_idController.text);
                },
                child: Text('Get Data')),
            Consumer<MyGetProvider>(builder: (context, value, child) {
              return Column(
                children: [
                  Text(context.read<MyGetProvider>().res?.id.toString() ?? 'null data'),
                  Text(context.read<MyGetProvider>().res?.userId.toString() ??
                      ''),
                  Text(context.read<MyGetProvider>().res?.title ?? ''),
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
