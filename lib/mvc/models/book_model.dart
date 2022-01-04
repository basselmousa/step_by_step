class Book {
  String name;
  String bookNo;
  String description;
  String status;
  String imagePath;

  Book({required this.name,
    required this.bookNo,
    required this.description,
    required this.status,
    this.imagePath = ''});

  factory Book.fromJSON(Map<String, dynamic> json){
    return Book(name: json['name'],
        bookNo: json['bookNo'],
        description: json['description'],
        status: json['status'],
        imagePath: json['imagePath']);

  }

  Map<String,dynamic> toJSON(){
    return {
      'name' : this.name,
      'description' : this.description,
      'bookNo' : this.bookNo,
      'status' : this.status,
      'imagePath': this.imagePath
    };
  }



}
