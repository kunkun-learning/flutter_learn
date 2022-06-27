import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text("normal"),
              onPressed: () {},
            ),
            TextButton(
              child: const Text("normal"),
              onPressed: () {},
            ),
            OutlineButton(
              child: const Text("normal"),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.thumb_up),
              onPressed: () {},
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.send),
              label: const Text("发送"),
              onPressed: () {},
            ),
            OutlineButton.icon(
              icon: const Icon(Icons.add),
              label: const Text("添加"),
              onPressed: () {},
            ),
            TextButton.icon(
              icon: const Icon(Icons.info),
              label: const Text("详情"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
