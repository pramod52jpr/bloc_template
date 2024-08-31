import 'package:bloc_template/utils/enum.dart';

class ApiResponse<T>{
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() {
    status = Status.loading;
  }

  ApiResponse.completed(data){
    status = Status.completed;
    if(this.data == null){
      this.data = data;
    }else{
      (this.data as List).add(data);
    }
  }

  ApiResponse.error(this.message) : status = Status.error;

  @override
  String toString(){
    return "Status : $status \n Message : $message \n Data : $data";
  }

}
