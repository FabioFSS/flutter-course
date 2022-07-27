import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  TransactionForm({Key? key, required this.onSubmit}) : super(key: key);

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              onSubmitted: (_) => _submitForm(),
              controller: valueController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Value (R\$)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: _submitForm,
                  child: const Text(
                    'New transaction',
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
