// Flutterアプリのエントリポイント
// アプリの基本的な構造を定義するために編集する。

import 'package:flutter/material.dart';

// アプリケーションのエントリポイント
void main() {
  // runApp() = アプリケーションのビルド・実行をする
  // MyAppをビルド、(home画面にMyHomePageウィジェットを設定の為、ホーム画面(初期画面にはそのウィジェット))
  runApp(const MyApp());
}

// Flutterアプリケーションのルートウィジェット
// アプリケーション全体に共通する要素の定義やテーマの設定等
class MyApp extends StatelessWidget {
  // MyAppのコンストラクタ
  // key = ウィジェットを一意に識別する為の特別なプロパティ(ウィジェット識別用のプロパティ)
  // MyAppのコンストラクタでウィジェットを識別する為の引数(key)
  const MyApp({super.key}); // MyAppのコンストラクタでクラスの初期化、クラス内ウィジェットの識別をする

  // This widget is the root of your application.
  // ウィジェットのビルド、表示内容を返す
  // MyAppウィジェットが返す(表示する)内容の定義をオーバーライドしたメソッドに定義(ルートウィジェットの為、全体共有される要素)
  @override
  Widget build(BuildContext context) {
    // 以下の表示内容を返す
    return MaterialApp(
      // デバッグのバナー表示無効化
      debugShowCheckedModeBanner: false,
      // アプリケーションの名前(全体共有される？),タスクビューの所だったり、タブの所に表示されたりする
      title: 'Flutter Test', // このタイトルはどこに反映されるんだろう
      // アプリ全体のテーマ
      theme: ThemeData(
        // カラースキーム(色管理)を使ってシードカラー(基本の色,テーマカラー)を設定(ルートウィジェットの為、アプリ全体共有)
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 204, 255)),
        // MaterialDesign3のデザインを使うか(適用するか)(従来or新バージョンみたいな)
        useMaterial3: true,
      ),
      // ライトモード、ダークモード
      // theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      // アプリケーションのホーム画面として表示するウィジェットを指定
      home: const MyHomePage(title: 'Flutter DemoApp'),
    );
  }
}

// 初期表示画面に設定してるウィジェット
// StatefulWidget=状態の変更に応じてビルドが再実行される
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
