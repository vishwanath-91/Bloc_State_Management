import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';

part 'sigin_event.dart';
part 'sigin_state.dart';

class SiginBloc extends Bloc<SiginEvent, SiginState> {
  SiginBloc() : super(const SiginState()) {
    on<SignInTextChangedEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(
          const SignInErrorState(
              errorMessage: "Please Enter Valid Email Address"),
        );
      } else if (event.passWordValue.length < 8) {
        emit(
          const SignInErrorState(errorMessage: "Please Enter valid Password"),
        );
      } else {
        emit(
          SignInValidState(),
        );
      }
    });
    on<SignInSubmittedEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
