class User {
  User({
    required this.name,
    required this.avatar,
    required this.zodiac,
    required this.history,
    required this.credit,
    required this.premium_status,
  });

  String name;
  String avatar;
  String zodiac;
  Map<String, List<dynamic>> history;
  num credit;
  bool premium_status;
}
