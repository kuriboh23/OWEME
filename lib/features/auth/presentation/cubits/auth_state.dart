import 'package:oweme/features/auth/domain/entities/app_user.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final AppUser user;
  AuthSuccess(this.user);
}

class AuthFailure extends AuthState {}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
