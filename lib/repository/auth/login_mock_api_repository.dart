import 'package:bloc_template/models/user/user_model.dart';
import 'package:bloc_template/repository/auth/login_repository.dart';

class LoginMockApiRepository implements LoginRepository{
  @override
  Future<UserModel> loginApi(dynamic data) async {
    await Future.delayed(const Duration(seconds: 2));
    var response = { "token" : "ujbhif8o87tf" };
    return UserModel.fromJson(response);
  }
}