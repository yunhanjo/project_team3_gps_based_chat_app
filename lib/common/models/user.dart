class User {
  String userID;
  String address;
  String userNM;
  String mapX;
  String mapY;
  User({
    required this.userID,
    required this.address,
    required this.userNM,
    required this.mapX,
    required this.mapY,
  });

  User.fromJson(Map<String, dynamic> map)
    : this(
        userID: map['userID'],
        address: map['address'],
        userNM: map['userNM'],
        mapX: map['mapX'],
        mapY: map['mapY'],
      );

  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'address': address,
      'userNM': userNM,
      'mapX': mapX,
      'mapY': mapY,
    };
  }
}
