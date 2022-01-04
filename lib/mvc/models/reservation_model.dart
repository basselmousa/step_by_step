class Reservation{

  String userId ;

  String bookId;
  String status;
  static   Map<String, dynamic> reservations = {};

  Reservation({
    required this.userId,
    required this.bookId,
    required this.status
});

  factory Reservation.fromJSON(Map<String,dynamic> json){
    return Reservation(userId: json['userNumber'], bookId: json['bookId'],status: json['status']);
  }


  static  fillReservations(Reservation reservation){
    reservations[reservation.bookId] = {
      'userNumber' : reservation.userId,
      'status' : reservation.status
    };
  }

}