import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_application/list_map_provider.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Page")),
      body: Consumer<ListMapProvider>(
        builder: (_, provider, __) {
          var allData=provider.getData();
          return allData.isNotEmpty
              ? ListView.builder(
                itemCount: allData.length,
                itemBuilder: (_, index) {
                return ListTile(
                  title: Text("${allData[index]["Name"]}"),
                  subtitle: Text("${allData[index]["Contact No"]}"),
                );
              })
              : Center(child: Text("NO DATA"));
          // ^ Same as:
          // ctx.watch<ListMapProvider>().getData();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ListMapProvider>().addData({
            "Name": "Xain",
            "Contact No": "12345679",
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
