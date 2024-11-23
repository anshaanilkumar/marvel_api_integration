import 'package:flutter/material.dart';
import 'Marlist.dart';

import 'apiclass.dart';
import 'list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marvel Characters',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MarvelListScreen(),
    );
  }
}

class MarvelListScreen extends StatefulWidget {
  const MarvelListScreen({Key? key}) : super(key: key);

  @override
  State<MarvelListScreen> createState() => _MarvelListScreenState();
}

class _MarvelListScreenState extends State<MarvelListScreen> {
  late Future<List<Marlist>> futureMarlist;

  @override
  void initState() {
    super.initState();
    futureMarlist = ApiService.fetchMarlist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marvel Characters',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
      centerTitle: true,
        elevation: 2,
      ),
      body: FutureBuilder<List<Marlist>>(
        future: futureMarlist,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No data available."));
          } else {
            final items = snapshot.data!;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return FruitItem(item: items[index]);
              },
            );
          }
        },
      ),
    );
  }
}
