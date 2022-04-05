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
  double _tipAmount = 0;
  double _totalBill = 0;
  double _tipPercent = 0.15;
  bool _goodService = false;

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
              "Tip Calculator",
              style: Theme.of(context).textTheme.headline4,
            ),
            // Get bill amount
            Text("Bill Amount"),
            TextField(controller: amountController),

            // Calculate Tip Button
            ElevatedButton(
                onPressed: ()
                {
                  setState(() {
                    _amount = double.parse(amountController.text);
                    _tipAmount = _amount * _tipPercent;
                    _totalBill = _amount + _tipAmount;
                  });
                },
                child: Text("Calcuate Tip")
            ),

            // Good Service bonus switch
            Row(
              children: [
              Switch(
                  value: _goodService,
                  onChanged: (value) {
                    setState(() {
                      _goodService = value;
                      if (_goodService) {
                        _tipPercent = 0.20;
                      } else {
                        _tipPercent = 0.15;
                      };
                    });
                  }
              ),
              Text("Good Service?"),
              ],
            ),
            // Display outputs
            Text("Bill Amount: \$" + _amount.toStringAsFixed(2),),
            Text("Tip: \$" + _tipAmount.toStringAsFixed(2),
              style: Theme.of(context).textTheme.headline4,),
            Text("Total Bill: \$" + _totalBill.toStringAsFixed(2),
              style: Theme.of(context).textTheme.headline4,),

          ],
        ),
      ),
    );
  }
}
