import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ety/features/auth/presentation/bloc/auth_event.dart';
import 'package:se7ety/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RegisterEvent>(register);
  }
  register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(RegisterLoadingState());
    try {
      var UserCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      User user = UserCredential.user!;
      user.updateDisplayName(event.name);
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthErrorState('كلمة المرور ضعيفة'));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthErrorState('البريد الالكتروني موجود بالفعل.'));
      }
    } catch (e) {
      emit(AuthErrorState('حدث خطا ما.'));
    }
  }
}
