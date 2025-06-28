class AuthValidator {
  static bool validateEmail(String email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email.trim());
  }

  static bool validatePassword(String password) {
    final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[^\s]{8,}$');
    return regex.hasMatch(password) && !password.contains(' ');
  }

  static bool isValidPhoneNumber(String phone) {
    final regex = RegExp(
      r'^(0|\+84)(3[2-9]|5[6|8|9]|7[0|6-9]|8[1-9]|9[0-9])[0-9]{7}$',
    );
    return regex.hasMatch(phone);
  }
}