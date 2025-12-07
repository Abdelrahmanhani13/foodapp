class UserModel {
  final String name;
  final String email;
  final String password;
  final String? image;
  final String? token;
  final String? address;
  final String? visa;

  UserModel( {
    required this.name,
    required this.email,
    required this.password,
    this.image,
    this.token,
    this.address,
    this.visa,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      image: json['image'],
      token: json['token'],
      address: json['address'],
      visa: json['visa'],
    );
  }
  
}
