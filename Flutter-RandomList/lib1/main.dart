import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(colorScheme: ColorScheme.dark()),
      debugShowCheckedModeBanner: false,
      home: rastgelesayiliste(),
    );
  }
}

class rastgelesayiliste extends StatefulWidget {
  @override
  _rastgelesayilisteState createState() => _rastgelesayilisteState();
}

class _rastgelesayilisteState extends State<rastgelesayiliste> {
  //rasgele sayi adındaki değilkenine  random sayı üretmesi için random yapıyoruz
  int rastgelesayi = Random().nextInt(100);
//sayi listesi
  List<int> sayilistesi = [];

  @override
  void initState() {
    super.initState();
    generaterastgelesayiliste();
  }

  void generaterastgelesayiliste() {
    sayilistesi.clear();
//10 tane rastgele sayi üretiyor
    for (int i = 0; i < 10; i++) {
      int rastgelesayi = Random().nextInt(100);
      sayilistesi.add(rastgelesayi);
    }
  }

//tari verilerini pc ve ya sunucudan alır
  var date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //tarihi yazar ekrana
        backgroundColor: Color.fromARGB(255, 104, 98, 98),
        title: Text("GÜN/AY : " +
            "D" +
            date.day.toString() +
            "/" +
            "M" +
            date.month.toString()),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              //rasgele sayi script
              setState(() {
                generaterastgelesayiliste();
                rastgelesayi = Random().nextInt(100);
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              child: Text(
                "Liste üretmek için tıklayınız".toString(),
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: sayilistesi.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Center(
                    //alttaki kod sayı listesindeki indexleri string yapar
                    child: Text(sayilistesi[index].toString()),
                  ),
                  //alttaki kod tıkladığımız sayıyı listeden çıkartıyor
                  onTap: () {
                    setState(() {
                      sayilistesi.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}