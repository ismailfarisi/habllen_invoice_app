import 'package:freezed_annotation/freezed_annotation.dart';

part 'firestore_failure.freezed.dart';

@freezed
abstract class FirestoreFailure with _$FirestoreFailure implements Exception {
  const factory FirestoreFailure.unexpected() = _Unexpected;
  const factory FirestoreFailure.notFound() = _NotFound;
  const factory FirestoreFailure.alreadyExists() = _AlreadyExists;
  const factory FirestoreFailure.unauthenticated() = _Unauthenticated;
}
