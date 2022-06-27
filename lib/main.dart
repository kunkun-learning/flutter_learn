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
            Text(
              //文本的对齐方式；可以选择左对齐、右对齐还是居中。注意，对齐的参考系是Text widget 本身！
              "嘿！师振昆！" * 30,
              textAlign: TextAlign.center,
              // 指定最大行数
              maxLines: 3,
              // 截断多余的文本，默认采用直接截断
              overflow: TextOverflow.ellipsis,
              // 相对于当前字体大小的缩放因子
              textScaleFactor: 1.3,
            ),
            // style 用于指定文本显示的样式如颜色、字体、粗细、背景等
            Text(
              "Hello world",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                  height: 1.2,
                  fontFamily: "Courier",
                  background: Paint()..color = Colors.yellow,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed),
            ),
            // TextSpan 实现了一个Text 内容的不同部分按照不同的样式显示
            const Text.rich(TextSpan(children: [
              TextSpan(text: "周恩来说: "),
              TextSpan(
                text: "为中华之崛起而读书！",
                style: TextStyle(color: Colors.redAccent),
              ),
            ])),
            DefaultTextStyle(
              //1.设置文本默认样式
              style: const TextStyle(
                color: Colors.green,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.start,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text("软件工程继承了父类字体样式"),
                  Text("计算机科学与技术继承了父类字体样式"),
                  Text(
                    "通信工程没有继承父类字体样式",
                    style: TextStyle(
                        inherit: false, //2.不继承默认样式
                        color: Colors.purple),
                  ),
                ],
              ),
            )

          ],

        ),
      ),
    );
  }
}
