import 'package:despesaspessoais/models/transaction.dart';
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
  final _transactions = [
    Transactions(
      id: 't1',
      title: 'Novo tenis vans',
      value: 300.00,
      date: DateTime.now(),
    ),
    Transactions(
      id: 't2',
     title: 'Lanches', 
     value: 17,
      date: DateTime.now(),),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Despesas Pessoais"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Card(
              color: Colors.red,
              child: Text("Grafico"),
            ),
          ),
         Column(
           children: _transactions.map((tr) {
             return Card(
               child: Row(
                 children: [
                 Container(
                   margin: EdgeInsets.symmetric(
                     horizontal: 15,
                     vertical: 10,
                   ),
                   decoration: BoxDecoration(
                     border: Border.all(
                       color: Colors.red,
                       width: 2
                     ),                   
                   ),
                   padding: EdgeInsets.all(10),
                   child: Text(
                     tr.value.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.red,
                      ),
                     ),
                 ),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(tr.title,
                    
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 16,
                       
                     ),

                     ),
                     Text(tr.date.toString(),
                     
                     style: TextStyle(
                       color: Colors.grey,
                     ),
                     ),
                   ],
                 )
               ]),
             );
           } ).toList(),
         )
        ],
      ),
    );
  }
}