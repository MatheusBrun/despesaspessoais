import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
    final titleController = TextEditingController();
    final valueController = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    return  Card(
          elevation: 5,
          child: Padding(padding: EdgeInsets.all(10),
          child: Column(children: [
            TextField(
             controller: titleController,
             decoration: InputDecoration(
              labelText: 'Título',
             ),

            ),
            
            TextField(
              controller: valueController,
              decoration: InputDecoration(
                labelText: 'Valor (R\$):'
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
            
              children: [
                
              TextButton( 
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.red,
                  minimumSize: Size(150, 40),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))
                  )
                ),
              child: Text('Nova transação +', 
              style: TextStyle(
                fontSize: 15,
               fontWeight: FontWeight.bold,),), 
              
              onPressed: (){
                print(titleController.text);
                print(valueController.text);
              },
               )
          ]),]
          ),
          ),

         );
  }
}