import 'package:equatable/equatable.dart';

class User extends Equatable {
  /// {@macro user}
  const User({
    this.email,
    required this.id,
    this.name,
    this.photo,
  });

  final String? email;

  /// The current user's id.
  final String id;

  /// The current user's name (display name).
  final String? name;

  /// Url for the current user's photo.
  final String? photo;

  /// Empty user which represents an unauthenticated user.
  static const empty = User(email: null, id: '', name: null, photo: null);

  @override
  List<Object?> get props => [email, id, name, photo];
}
