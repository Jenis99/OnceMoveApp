class AppValidator {
  static String? userNameValidation(String? value) {
    if (value!.isEmpty) {
      return "Please enter user name";
    } else {
      return null;
    }
  }

  static bool emailValidation(String? value) {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value!);
  }
  static String? userEmailValidation(String? value) {
    if (value!.isEmpty) {
      return "Please enter password";
    } else if (value!.length < 8) {
      return "Please enter at Least 8 digit password";
    } else {
      return null;
    }
  }

  static String? passwordValidation(String? value) {
    if (value!.isEmpty) {
      return "Please enter password";
    } else if (value!.length < 8) {
      return "Please enter at Least 8 digit password";
    } else {
      return null;
    }
  }

  static String? confirmPassword(String? value) {
    if (value!.isEmpty) {
      return "Please enter password";
    } else if (value!.length < 8) {
      return "Please enter at Least 8 digit password";
    } else {
      return null;
    }
  }
}
