import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_application/list_map_provider.dart';

class AddDataPage extends StatelessWidget {
  const AddDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Note")),
      body: Center(
        child: IconButton(
          onPressed: () {
            context.read<ListMapProvider>().addData({
              "Name": "Xain",
              "Contact No": "12345679",
            });
          },
          icon: Icon(Icons.add),
        ),
      ),
    );
  }
}
