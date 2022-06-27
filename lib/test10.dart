import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedSwitcher组件'),
      ),
      body:
      HeroAnimationRouteA(), //想切换动画效果时，只需将HeroAnimationRouteB替换AnimatedSwitcherCounterRoute即可
    );
  }
}

/**
 * Hero动画
 */
class HeroAnimationRouteA extends StatelessWidget {
  const HeroAnimationRouteA({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            InkWell(
              child: Hero(
                tag: 'avatar', //唯一标记，前后两个路由页Hero的tag必须相同
                child: ClipOval(
                  child: Image.network(
                    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F811%2F0HQ4104127%2F140HQ04127-5-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1658637954&t=051e8436086fe8ca3763ac5a53f4eb3a',
                    width: 50.0,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context, PageRouteBuilder(
                  pageBuilder:
                      (BuildContext context, animation, secondaryAnimation) {
                    return FadeTransition(
                      opacity: animation,
                      child: Scaffold(
                        appBar: AppBar(
                          title: Text('原图'),
                        ),
                        body: HeroAnimationRouteB(),
                      ),
                    );
                  },
                ));
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 80.0),
              child: Text('点击头像'),
            ),
          ],
        ));
  }
}

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
        child: Image.network("https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F811%2F0HQ4104127%2F140HQ04127-5-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1658637954&t=051e8436086fe8ca3763ac5a53f4eb3a"),
      ),
    );
  }
}
/**
 * AnimatedSwitcher组件
 */
// class AnimatedSwitcherCounterRoute extends StatefulWidget {
//   const AnimatedSwitcherCounterRoute({Key? key}) : super(key: key);
//
//   @override
//   _AnimatedSwitcherCounterRouteState createState() =>
//       _AnimatedSwitcherCounterRouteState();
// }
//
// class _AnimatedSwitcherCounterRouteState
//     extends State<AnimatedSwitcherCounterRoute> {
//   int _count = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           AnimatedSwitcher(
//             duration: const Duration(milliseconds: 500),
//             transitionBuilder: (Widget child, Animation<double> animation) {
//               //执行缩放动画
//               return ScaleTransition(child: child, scale: animation);
//             },
//             child: Text(
//               '$_count',
//               //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
//               key: ValueKey<int>(_count),
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ),
//           ElevatedButton(
//             child: const Text(
//               '+1',
//             ),
//             onPressed: () {
//               setState(() {
//                 _count += 1;
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }