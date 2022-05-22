class AuthModel {
  final String email;
  final String name;
  final String token;

  AuthModel({
    required this.email,
    required this.name,
    required this.token,
  });

  Map<String, dynamic> toMap() => {
        'email': email,
        'name': name,
        'token': token,
      };

  factory AuthModel.toModel(dynamic map) =>
      AuthModel(email: map['email'], name: map['name'], token: map['token']);
}
