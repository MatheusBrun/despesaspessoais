
class Transaction{
  String id = '';
  String title = '';
  double value = 0;
  DateTime date;

  Transaction({
    required this.id,
    required this.title,
    required this.value,
    required this.date,
  });
}
