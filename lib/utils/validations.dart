class Validations{
  static bool emailValidator(String email){
    bool emailValidation = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(email);
    return emailValidation;
  }
}