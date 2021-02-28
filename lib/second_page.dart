import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// own import
import 'count_notifier.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(
          'Made by WenYeh',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5),
        ),
        centerTitle: true,
      ),
      body: Center(
        // 透過 Consumer 來接收更改對應資料
        child: Consumer<CountNotifier>(builder: (context, counter, _) {
          return Text('You hit me: ${counter.count} times',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                  fontSize: 25));
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.add, color: Colors.white,),
            heroTag: "btn1",
            onPressed: () {
              // 使用 Provider.of，並且將 listen 設定為 false(若沒設定，預設為 true)，
              // 則不會再次調用 Widget 重新構建（ build ）畫面 ，更省效能。
              Provider.of<CountNotifier>(context, listen: false)
                  .increment();
            },
          ),
          SizedBox(
            height: 16.0,
          ),
          FloatingActionButton(
            heroTag: "btn2",
            child: const Icon(Icons.remove, color: Colors.white,),
            onPressed: () {
              Provider.of<CountNotifier>(context, listen: false)
                  .decrement();
            },
          ),
        ],
      ),
    );
  }
}
