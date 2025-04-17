import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_application/counter_provider.dart';
import 'package:provider_application/list_map_provider.dart';
import 'package:provider_application/list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CounterProvider()),
          ChangeNotifierProvider(create: (context) => ListMapProvider()),
        ],
        child: ListPage(),
      ),
      /*ChangeNotifierProvider(
        create: (_) => ListMapProvider(),
        child: ListPage(),
        create: (context) => CounterProvider(),
        child: HomePage(),
      ),*/
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    print("Build Context");
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: Consumer<CounterProvider>(
          builder: (ctx, _, __) {
            print("Consumer Context");
            return Text(
              // "${Provider.of<CounterProvider>(ctx, listen: true).getCount()}",
              // listen is true by default but we can also use:
              "${ctx.watch<CounterProvider>().getCount()}",
              style: TextStyle(fontSize: 25),
            );
          },
        ),
        // context being used is same as build function
        // this results in the entire page being rebuilt
        // use consumer!!
        /*Text(
          "${Provider.of<CounterProvider>(context, listen: true).getCount()}",
          style: TextStyle(fontSize: 25),),*/
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // listen MUST be false here since data is being changed, not observed
          // Provider.of<CounterProvider>(context, listen: false).incrementCount();
          // OR:
          context.read<CounterProvider>().incrementCount();
        },
      ),
    );
  }
}
