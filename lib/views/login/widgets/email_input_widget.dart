import 'package:bloc_template/bloc/login/login_bloc.dart';
import 'package:bloc_template/utils/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailInputWidget extends StatelessWidget {
  final FocusNode emailFocusNode;
  const EmailInputWidget({super.key, required this.emailFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          focusNode: emailFocusNode,
          decoration: const InputDecoration(hintText: "email", border: OutlineInputBorder()),
          onChanged: (value) {
            context.read<LoginBloc>().add(EmailChanged(email: value));
          },
          validator: (value) {
            if(value!.isEmpty){
              return "Enter email";
            }
            if(!Validations.emailValidator(value)){
              return "Please Enter Valid Email";
            }
            return null;
          },
          onFieldSubmitted: (value) {},
        );
      },
    );
  }
}
