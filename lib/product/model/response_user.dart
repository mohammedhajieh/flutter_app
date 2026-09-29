class ResponseUser {
  final int? id;
  final String? name;
  final String? userName;

  ResponseUser({required this.id, required this.name, required this.userName});

  factory ResponseUser.fromJson(Map<String, dynamic> json) {
    return ResponseUser(
      id: json['id'],
      name: json['name'],
      userName: json['user_name'],
    );
  }
}
