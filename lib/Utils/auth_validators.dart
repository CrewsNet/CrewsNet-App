mixin InputValidationMixin {
  bool isPasswordValid(String password) => password.length == 8;
  bool isNameValid(String name) => name.length > 1;
  bool isEmailValid(String email) {
    RegExp regex = new RegExp(r"^[A-Za-z0-9+_.-]+@(.+)$");
    return regex.hasMatch(email);
  }
}