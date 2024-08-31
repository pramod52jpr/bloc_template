class AppExceptions implements Exception{
  final dynamic _message;
  final dynamic _prefix;
  const AppExceptions([this._message, this._prefix]);

  @override
  String toString(){
    return "$_message $_prefix";
  }
}

class FetchDataException extends AppExceptions{
  const FetchDataException([String? message]) : super(message, "Fetch data exception");
}

class NoInternetException extends AppExceptions{
  const NoInternetException([String? message]) : super(message, "No Internet Exception");
}

class UnauthorisedException extends AppExceptions{
  const UnauthorisedException([String? message]) : super(message, "You don't have access to this");
}

class RequestTimeOutException extends AppExceptions{
  const RequestTimeOutException([String? message]) : super(message, "Request time out");
}