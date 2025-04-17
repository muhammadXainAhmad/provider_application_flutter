import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_application/add_data_page.dart';
import 'package:provider_application/list_map_provider.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Page")),
      body: Consumer<ListMapProvider>(
        builder: (_, provider, __) {
          var allData = provider.getData();
          return allData.isNotEmpty
              ? ListView.builder(
                itemCount: allData.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    title: Text("${allData[index]["Name"]}"),
                    subtitle: Text("${allData[index]["Contact No"]}"),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              context.read<ListMapProvider>().updateData({
                                "Name": "Updated Contact",
                                "Contact No": "987654321",
                              }, index);
                            },
                            icon: Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              context.read<ListMapProvider>().deleteData(index);
                            },
                            icon: Icon(Icons.delete,color: Colors.red,),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
              : Center(child: Text("NO DATA"));
          // ^ Same as:
          // ctx.watch<ListMapProvider>().getData();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddDataPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
