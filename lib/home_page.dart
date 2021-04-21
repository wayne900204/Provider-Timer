import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// own import
import 'count_notifier.dart';
import 'package:provider_count/second_page.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //透過 Provider.of 來獲取資料
    final counter = Provider.of<CountNotifier>(context);

    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(
          'Timer using provider',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You hit me: ${counter.count} times',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                    fontSize: 25)),
            SizedBox(
              height: 16,
            ),
            MaterialButton(
              elevation: 1,
              color: Colors.white,
              //點擊按鈕後，導轉跳到B頁
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SecondPage()),
              ),
              child: Text('Go to next Page'),
            ),
          ],
        ),
      ),
    );
  }
}
