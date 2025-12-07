
import 'package:bloc/bloc.dart';
import 'package:foodapp/core/error/failure.dart';
import 'package:foodapp/features/auth/data/auth_repo.dart';
import 'package:foodapp/features/auth/data/model/user_model.dart';
import 'package:meta/meta.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(this.authRepo)
    : super(AuthenticationInitial());

  final AuthRepo authRepo;

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      final user = await authRepo.login(email, password);
      if (user != null) {
        emit(LoginSuccess(user));
      } else {
        emit(LoginFailure('Login failed. Please try again.'));
      }
    } on ServerFailure catch (e) {
      emit(LoginFailure(e.errMessage));
    } catch (e) {
      emit(LoginFailure('An unexpected error occurred. Please try again.'));
    }
  }

  Future<void> register(String name, String email, String password) async {
    emit(RegisterLoading());
    try {
      final user = await authRepo.register(name, email, password);
      if (user != null) {
        emit(RegisterSuccess(user));
      } else {
        emit(RegisterFailure('Registration failed. Please try again.'));
      }
    } on ServerFailure catch (e) {
      emit(RegisterFailure(e.errMessage));
    } catch (e) {
      emit(RegisterFailure('An unexpected error occurred. Please try again.'));
    }
  }

  Future<void> fetchUserProfile() async {
    emit(ProfileLoading());
    try {
      final user = await authRepo.getUserProfile();
      if (user != null) {
        emit(ProfileSuccess(user));
      } else {
        emit(ProfileFailure('Failed to fetch profile. Please try again.'));
      }
    } on ServerFailure catch (e) {
      emit(ProfileFailure(e.errMessage));
    } catch (e) {
      emit(ProfileFailure('An unexpected error occurred. Please try again.'));
    }
  }


}
