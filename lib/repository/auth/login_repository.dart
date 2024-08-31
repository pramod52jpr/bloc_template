import 'package:bloc_template/models/user/user_model.dart';

abstract class LoginRepository{
  Future<UserModel> loginApi(dynamic data);
}