class AppValidator {
  static String? userNameValidation(String? value) {
    if (value!.isEmpty) {
      return "Please enter user name";
    } else {
      return null;
    }
  }
  static String? userEmailValidation(String? value) {
    if (value!.isEmpty) {
      return "Please enter email";
    } else {
      return null;
    }
  }

  static String? passwordValidation(String? value) {
    if (value!.isEmpty) {
      return "Please enter password";
    } else {
      return null;
    }
  }
  static String? confirmPassword(String? value) {
    if (value!.isEmpty) {
      return "Please enter same Password";
    } else {
      return null;
    }
  }

}
