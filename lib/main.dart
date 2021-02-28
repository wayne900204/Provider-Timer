import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// own import
import 'count_notifier.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //在 widget 元件樹中的最上層，使用 provider ，方便傳遞到其他底層頁面
    //建議採用 MultiProvider，因為一個 APP 很少一個 provider 就夠用，所以直接上 MultiProvider 。
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: CountNotifier())],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: HomePage(),
      ),
    );
  }
}
