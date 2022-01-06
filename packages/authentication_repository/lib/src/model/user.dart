import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    this.email,
    required this.id,
    this.name,
    this.photo,
  });

  final String? email;
  final String id;
  final String? name;
  final String? photo;
  static const empty = User(email: null, id: '', name: null, photo: null);

  @override
  List<Object?> get props => [email, id, name, photo];
}
