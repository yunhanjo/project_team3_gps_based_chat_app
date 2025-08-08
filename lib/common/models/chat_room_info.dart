class ChatRoomInfo {
  String chatID;
  String name;
  String address;
  String chatNM;
  String category;
  String descript;
  String hostkey;
  ChatRoomInfo({
    required this.chatID,
    required this.name,
    required this.address,
    required this.chatNM,
    required this.category,
    required this.descript,
    required this.hostkey,
  });

  ChatRoomInfo.fromJson(Map<String, dynamic> map, String id)
    : this(
        chatID: id,
        name: map['name'],
        address: map['address'],
        chatNM: map['chatNM'],
        category: map['category'],
        descript: map['descript'],
        hostkey: map['hostkey'],
      );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'chatNM': chatNM,
      'category': category,
      'descript': descript,
      'hostkey': hostkey,
    };
  }
}
