import 'dart:math';

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transaction_form.dart';
import 'transctio_list.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({ Key? key }) : super(key: key);

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {


  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo tenis vans',
      value: 300.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
     title: 'Lanches', 
     value: 17,
    date: DateTime.now(),),


  ];

  _addTransaction(String title, double value){
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
       title: title,
        value: value, 
        date: DateTime.now(),
        );
  }



  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
         TransactionList(_transactions),
      TransactionForm(),
   
    ],      
    );
  }
}