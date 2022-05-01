import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required String title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class ProductInfo {
  final String name;
  final double price;
  ProductInfo(this.name, this.price);
}

final List<ProductInfo> product = [
  ProductInfo("iPhoneX", 80000),
  ProductInfo("iPhone 12", 2000),
  ProductInfo("Xiaomi 12", 7688),
  ProductInfo("Poco F3", 215213),
  ProductInfo("Samsung S22 Ultra", 43532),
];

class _MyHomePageState extends State<MyHomePage> {
  int indexOfProduct = 0;
  double? yourPrice;
  String result = "";
  bool isCorrect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(100)),
            Text(
              product[indexOfProduct].name,
              style: const TextStyle(
                fontSize: 24,
                color: Color.fromARGB(255, 138, 38, 201),
                fontFamily: "FiraCode",
              ),
              textAlign: TextAlign.center,
              // color of text is red
            ),
            const Padding(padding: EdgeInsets.all(15)),
            SizedBox(
              width: 200,
              child: TextField(
                onChanged: (String value) {
                  yourPrice = double.tryParse(value);
                },
                keyboardType: TextInputType.number,
                // ignore: unnecessary_const
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  hintText: 'Enter some text',
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(15)),
            Text(
              result,
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 241, 22, 99),
                fontFamily: "FiraCode",
              ),
              textAlign: TextAlign.center,
              // color of text is red
            ),
            const Padding(padding: EdgeInsets.all(8)),
            ElevatedButton(
              child: const Text("Check Price"),
              onPressed: () {
                setState(() {
                  isCorrect =
                      product[indexOfProduct].price == yourPrice ? true : false;
                  result = isCorrect ? "Correct" : "Wrong";
                  indexOfProduct += isCorrect ? 1 : 0;
                  if (indexOfProduct == product.length) {
                    indexOfProduct = 0;
                  }
                });
              },
            ),
            const Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    indexOfProduct++;
                    if (indexOfProduct == product.length) {
                      indexOfProduct = 0;
                    }
                    // yourPrice = null;
                    // result = "";
                  });
                },
                child: const Text('Next Product')),
          ],
        ),
      ),
    );
  }
}
