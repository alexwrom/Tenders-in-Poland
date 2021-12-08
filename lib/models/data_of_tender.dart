
class DataOfTender {
  final String? description;
  final String? category;
  final String? title;
  final String? deadline_date;
  final String? awarded_value_eur;

  DataOfTender({this.description,this.category,this.title,this.deadline_date,this.awarded_value_eur});

  factory DataOfTender.fromJson(dynamic json) {
    return DataOfTender(
        description: json['description'],
        category: json['category'],
        title: json['title'],
        deadline_date: json['deadline_date'],
        awarded_value_eur: json['awarded_value_eur']
    );
  }
}