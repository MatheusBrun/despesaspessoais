import 'package:despesaspessoais/components/adaptative_button.dart';
import 'package:despesaspessoais/main.dart';
import 'package:flutter/material.dart';
import 'adaptative_text_fild.dart';
import 'adaptative_date_picker.dart';

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 20 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(children: [
            Text(
              'Total: $total',
              style: TextStyle(
                fontSize: 18,
                color: Colors.orange,
              ),
            ),
            AdaptativeTextField(
              label: 'Título',
              controller: titleController,
              onSubmitted: (_) => _submitForm(),
            ),
            AdaptativeTextField(
              label: 'Valor (R\$):',
              controller: valueController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
            ),
            AdaptativeDatePicker(
              selectedDate: _selectedDate,
              onDateChanged: (newDate) {
                setState(() {
                  _selectedDate = newDate;
                });
              },
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              AdaptativeButton(label: 'Nova Transação', onPressed: _submitForm)
            ]),
          ]),
        ),
      ),
    );
  }
}
