import 'package:bloc/bloc.dart';
import 'package:bloc_template/models/user/user_model.dart';
import 'package:bloc_template/repository/auth/login_repository.dart';
import 'package:bloc_template/services/session_manager/session_controller.dart';
import 'package:bloc_template/utils/enum.dart';
import 'package:equatable/equatable.dart';
part 'login_event.dart';
part 'login_states.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates>{

  LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(const LoginStates()){
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApi>(_loginApi);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginStates> emit){
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginStates> emit){
    emit(state.copyWith(password: event.password));
  }

  void _loginApi(LoginApi event, Emitter<LoginStates> emit) async{
    try{
      emit(state.copyWith(postApiStatus: PostApiStatus.loading));
      // Map<String, dynamic> data = {
      //   "email" : "eve.holt@reqres.in",
      //   "password" : "cityslicka"
      // };
      Map<String, dynamic> data = {
        "email" : state.email,
        "password" : state.password,
      };
      UserModel res = await loginRepository.loginApi(data);
      if(res.error.isEmpty){
        emit(state.copyWith(message: "Login Successful", postApiStatus: PostApiStatus.success));
        await SessionController().saveUserInPreference(res);
        await SessionController().getUserFromPreference();
      }else{
        emit(state.copyWith(message: res.error.toString(), postApiStatus: PostApiStatus.error));
      }
    }catch(e){
      emit(state.copyWith(
          message: e.toString(),
        postApiStatus: PostApiStatus.error
      ));
    }
  }

}