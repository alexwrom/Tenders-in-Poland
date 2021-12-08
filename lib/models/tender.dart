class Tender {
  final String id;
  final String category;
  final String title;

  Tender({required this.id,required this.category,required this.title});

  factory Tender.fromJson(Map<String,dynamic> json) {
    return Tender(
      id: json['id'],
      category: json['category'],
      title: json['title']
    );
  }
}

