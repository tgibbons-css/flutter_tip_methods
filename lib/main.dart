import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
  final amountController = TextEditingController();

  double _amount = 0;
  double _totalBill = 0;
  double _tipPercent = 1.15;

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

            Text("Tip Calculator"),
            Text("Bill Amount"),
            TextField(controller: amountController),

            ElevatedButton(
                onPressed: ()
                {
                  _amount = double.parse(amountController.text);

                  _totalBill = _amount * _tipPercent;

                },
                child: Text("Calcuate Tip")
            ),

            Switch(
                value: false,
                onChanged: (value) { _tipPercent = 1.20; }
                ),

            Text("Bill Amount: " + _amount.toStringAsFixed(2)),
            Text("Tip: " + _amount.toStringAsFixed(2)),
            Text("Total Bill: " + _totalBill.toStringAsFixed(2)),

          ],
        ),
      ),
    );
  }
}
