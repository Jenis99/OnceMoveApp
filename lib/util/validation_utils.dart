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
    } else if (value!.length < 8) {
      return "Please enter at Least 8 digit password";
    }
    else {
      return null;
    }
  }

  static String? confirmPassword(String? value) {
    if (value!.isEmpty) {
      return "Please enter password";
    } else if (value!.length < 8) {
      return "Please enter at Least 8 digit password";
    }
    else {
      return null;
    }
  }

}
