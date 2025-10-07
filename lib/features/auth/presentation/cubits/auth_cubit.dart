import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oweme/features/auth/domain/entities/app_user.dart';
import 'package:oweme/features/auth/domain/repositories/auth_repo.dart';
import 'package:oweme/features/auth/presentation/cubits/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  AppUser? _currentUser;

  AuthCubit({required this.authRepo}) : super(AuthInitial());

  void checkAuth() async {
    final AppUser? user = await authRepo.getCurrentUser();
    if (user != null) {
      _currentUser = user;
      emit(AuthSuccess(user));
    } else {
      emit(AuthFailure());
    }
  }

  AppUser? get currentUser => _currentUser;

  Future<void> login(String email, String password) async {
    try {
      final user = await authRepo.loginWithEmailAndPassword(email, password);

      if (user != null) {
        _currentUser = user;
        emit(AuthSuccess(user));
      } else {
        emit(AuthFailure());
      }
    } catch (e) {
      emit(AuthError('$e'));
      emit(AuthFailure());
    }
  }

  Future<void> register(String name, String email, String password) async {
    try {
      final user = await authRepo.registerWithEmailAndPassword(name, email, password);

      if (user != null) {
        _currentUser = user;
        emit(AuthSuccess(user));
      } else {
        emit(AuthFailure());
      }
    } catch (e) {
      emit(AuthError('$e'));
      emit(AuthFailure());
    }
  }

  Future<void> logout() async {
    authRepo.logout();
    emit(AuthFailure());
  }
}
