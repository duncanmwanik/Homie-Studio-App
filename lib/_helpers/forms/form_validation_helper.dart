import 'regex_checks.dart';

class Validator {
  static String? validateName({required String name}) {
    if (name.isEmpty) return 'Please enter name';
    return null;
  }

  static String? validateEmail({required String email}) {
    if (email.isEmpty) {
      return 'Please enter email';
    } else if (!isValidEmail(email)) {
      return 'Enter valid email';
    }

    return null;
  }

  static String? validatePassword({required String password}) {
    if (password.isEmpty) {
      return 'Please enter password';
    } else if (password.length < 8) {
      return 'Password should be at least 8 characters';
    }

    return null;
  }
}
