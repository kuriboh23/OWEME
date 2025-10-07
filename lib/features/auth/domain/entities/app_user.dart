class AppUser {
  final String uid;
  final String name;
  final String email;
  final double balance;
  final double owe;
  final double owed;
  final List<AppUser> friends;

  AppUser({
    required this.uid,
    required this.name,
    required this.email,
    required this.balance,
    required this.owe,
    required this.owed,
    required this.friends,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'balance': balance,
      'owe': owe,
      'owed': owed,
      'friends': friends,
    };
  }

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      balance: json['balance'],
      owe: json['owe'],
      owed: json['owed'],
      friends: json['friends'],
    );
  }
}
