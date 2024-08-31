import 'package:bloc_template/bloc/login/login_bloc.dart';
import 'package:bloc_template/config/routes/routes_name.dart';
import 'package:bloc_template/utils/enum.dart';
import 'package:bloc_template/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const LoginButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginStates>(
      listenWhen: (previous, current) => previous.postApiStatus != current.postApiStatus,
      listener: (context, state) {
        if(state.postApiStatus == PostApiStatus.error){
          Utils.showFlushBar(state.message, FlushBarType.error, context);
        }
        if(state.postApiStatus == PostApiStatus.success){
          Utils.showFlushBar(state.message, FlushBarType.success, context);
          Navigator.pushNamed(context, RoutesName.homeScreen);
        }
      },
      child: BlocBuilder<LoginBloc, LoginStates>(
        buildWhen: (previous, current) => previous.postApiStatus != current.postApiStatus,
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              if(formKey.currentState!.validate()){
                  context.read<LoginBloc>().add(LoginApi());
              }
            },
            child: state.postApiStatus == PostApiStatus.loading ? const CircularProgressIndicator() : const Text("Login"),
          );
        },
      ),
    );
  }
}

