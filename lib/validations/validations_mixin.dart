// ignore_for_file: unrelated_type_equality_checks

mixin ValidationsMixin {
  bool isLowerCase(String text) {
    return RegExp(r'^[a-z]*$').hasMatch(text);
  }

  bool isPasswordValid(String password) {
    return password.length >= 6;
  }

  /* bool arePasswordsEqual(String password, String confirmPassword) {
    return password == confirmPassword;
  } */
}
