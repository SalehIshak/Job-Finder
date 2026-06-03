enum InputType { email, password, number, text }

class AppValidator {
  AppValidator._();

  static String? validateInput(
    String? value, {
    int min = 2,
    int max = 100,
    InputType type = InputType.text,
    bool isRequired = true,
  }) {
    if ((value == null || value.isEmpty) && !isRequired) return null;
    if (value == null || value.isEmpty) return "This field is required.";

    switch (type) {
      case InputType.email:
        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) return " Please enter a valid email address.";
        return null;

      case InputType.password:
        if (value.length < min) return "Must be at least $min characters long.";
        if (!RegExp(r'[A-Z]').hasMatch(value)) return "Must contain at least one uppercase letter.";
        if (!RegExp(r'[0-9]').hasMatch(value)) return "Must contain at least one number.";
        return null;

      case InputType.number:
        final cleaned = value.replaceAll(" ", "");
        if (!RegExp(r'^\d+$').hasMatch(cleaned)) return "Only numeric characters are allowed.";
        if (cleaned.length < min) return "Must be at least $min digits long.";
        if (cleaned.length > max) return "Must be less than $max digits long.";
        return null;

      case InputType.text:
        if (value.length < min) return "Must be at least $min characters long.";
        if (value.length > max) return "Must be less than $max characters long.";
        return null;
    }
  }

  // COMFIRM PASSWORD VALIDATOR
  static String? confirmPasswordValidator(String value, String oregenalpassword) {
    final error = validateInput(value, min: 6, type: InputType.password);
    if (error != null) return error;

    if (value != oregenalpassword) return " Passwords do not match.";
    return null;
  }
}
