import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Searh'),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: MySearch());
              },
              icon: Icon(Icons.search))
        ],
      ),
    );
  }
}

class MySearch extends SearchDelegate {
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null), icon: Icon(Icons.arrow_back));

  List<Widget>? buildActions(BuildContext context) =>
      [IconButton(onPressed: () {}, icon: Icon(Icons.search))];
  Widget buildResults(BuildContext context) => Container();
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestion = ['kinan'];
    return ListView.builder(
      itemBuilder: (context, index) {
        final suggest = suggestion[index];
      },
    );
  }
}
