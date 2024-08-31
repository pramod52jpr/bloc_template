import 'package:bloc_template/config/app_url.dart';
import 'package:bloc_template/data/network/network_api_services.dart';
import 'package:bloc_template/models/user/user_model.dart';
import 'package:bloc_template/repository/auth/login_repository.dart';

class LoginHttpApiRepository implements LoginRepository{
  final _api = NetworkApiServices();

  @override
  Future<UserModel> loginApi(dynamic data) async {
    final response = await _api.postRequest(AppUrl.loginApi, data);
    return UserModel.fromJson(response);
  }
}