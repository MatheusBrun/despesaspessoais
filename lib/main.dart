import 'package:despesaspessoais/components/transaction_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main(List<String> args) {
  runApp(ExpensesApp());
}
class ExpensesApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }


}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Despesas Pessoais"),
      ),
      body: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Card(
              color: Colors.red,
              child: Text("Grafico"),
            ),
          ),
         TransactionUser(),       
         
        ],
      ),
    );
  }
}