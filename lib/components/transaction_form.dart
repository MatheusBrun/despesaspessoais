import 'package:despesaspessoais/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  var _selectedDate = DateTime.now();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }

    widget.onSubmit(title, value, _selectedDate);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          Text(
            'Total: $total',
            style: TextStyle(
              fontSize: 18,
              color: Colors.orange,
            ),
          ),
          TextField(
            controller: titleController,
            onSubmitted: (_) => _submitForm(),
            decoration: InputDecoration(
              labelText: 'Título',
            ),
          ),
          TextField(
            controller: valueController,
            onSubmitted: (_) => _submitForm(),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(labelText: 'Valor (R\$):'),
          ),
          Container(
            height: 70,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'Nenhuma data selecionada!'
                        : 'Data Selecionada: ${DateFormat('dd/MM/y').format(_selectedDate)}',
                  ),
                ),
                TextButton(
                  child: Text(
                    'Selcionar Data',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  onPressed: _showDatePicker,
                )
              ],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.red,
                  minimumSize: Size(150, 40),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)))),
              child: Text(
                'Nova transação +',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: _submitForm,
            )
          ]),
        ]),
      ),
    );
  }
}
