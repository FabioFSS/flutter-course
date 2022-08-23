class Transaction {
  final int id;
  final String title;
  final double value;
  final DateTime date;

  const Transaction({
    required this.id,
    required this.title,
    required this.value,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'value': value,
      'date': date,
    };
  }

  @override
  String toString() {
    return 'Transaction{id: $id, title: $title, value: $value, date: $date}';
  }
}
