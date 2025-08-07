class ChatRoomInfo {
  String chatID;
  String name;
  String address;
  String chatNM;
  String descript;
  String hostkey;
  ChatRoomInfo({
    required this.chatID,
    required this.name,
    required this.address,
    required this.chatNM,
    required this.descript,
    required this.hostkey,
  });

  ChatRoomInfo.fromJson(Map<String, dynamic> map)
    : this(
        chatID: map['chatID'],
        name: map['name'],
        address: map['address'],
        chatNM: map['chatNM'],
        descript: map['descript'],
        hostkey: map['hostkey'],
      );

  Map<String, dynamic> toJson() {
    return {
      'chatID': chatID,
      'name': name,
      'address': address,
      'chatNM': chatNM,
      'descript': descript,
      'hostkey': hostkey,
    };
  }
}
