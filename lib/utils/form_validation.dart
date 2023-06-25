class FormValidationResponse {
  bool isValid;
  String message;

  FormValidationResponse({required this.isValid, required this.message});
}

class FormValidation {
  static FormValidationResponse validateRegister(Map<String, dynamic> data) {
    if(data['fullName'] == null || data['fullName']!.isEmpty) {
      return FormValidationResponse(isValid: false, message: 'Please enter your full name');
    }
    if(data['fullName']!.length < 3) {
      return FormValidationResponse(isValid: false, message: 'Full name must be at least 3 characters long');
    }
    if(data['dateOfBirth'] == null || data['dateOfBirth']!.isEmpty) {
      return FormValidationResponse(isValid: false, message: 'Please enter your date of birth');
    }
    if(data['email'] == null || data['email']!.isEmpty) {
      return FormValidationResponse(isValid: false, message: 'Please enter your email');
    }
    if(data['email']!.length < 6) {
      return FormValidationResponse(isValid: false, message: 'Email must be at least 6 characters long');
    }
    if(data['email'].length > 50) {
      return FormValidationResponse(isValid: false, message: 'Email must be less than 50 characters long');
    }
    if(data['password'] == null || data['password']!.isEmpty) {
      return FormValidationResponse(isValid: false, message: 'Please enter your password');
    }
    if(data['password']!.length < 6) {
      return FormValidationResponse(isValid: false, message: 'Password must be at least 6 characters long');
    }
    if(data['confirmPassword'] == null || data['confirmPassword']!.isEmpty) {
      return FormValidationResponse(isValid: false, message: 'Please confirm your password');
    }
    if(data['password'] != data['confirmPassword']) {
      return FormValidationResponse(isValid: false, message: 'Passwords do not match');
    }
    if(data['privacyPolicy'] == null || !data['privacyPolicy']) {
      return FormValidationResponse(isValid: false, message: 'Please accept the privacy policy');
    }
    return FormValidationResponse(isValid: true, message: '');
  }

  static FormValidationResponse validateLogin(Map<String, dynamic> data) {
    if(data['email'] == null || data['email']!.isEmpty) {
      return FormValidationResponse(isValid: false, message: 'Please enter your email');
    }
    if(data['password'] == null || data['password']!.isEmpty) {
      return FormValidationResponse(isValid: false, message: 'Please enter your password');
    }
    return FormValidationResponse(isValid: true, message: '');
  }

  static FormValidationResponse validateEmail(String email) {
    if(email.isEmpty) {
      return FormValidationResponse(isValid: false, message: 'Please enter your email');
    }
    return FormValidationResponse(isValid: true, message: '');
  }

  static FormValidationResponse validateResetPasswordCode(String code) {
    if(code.isEmpty) {
      return FormValidationResponse(isValid: false, message: 'Please enter your reset password code');
    }
    if(!RegExp(r'^[0-9]+$').hasMatch(code)) {
      return FormValidationResponse(isValid: false, message: 'Please enter a valid reset password code');
    }
    return FormValidationResponse(isValid: true, message: '');
  }

  static validateResetPassword(Map<String, dynamic> data) {
    if(data['password'] == null || data['password']!.isEmpty) {
      return FormValidationResponse(isValid: false, message: 'Please enter your password');
    }
    if(data['password']!.length < 6) {
      return FormValidationResponse(isValid: false, message: 'Password must be at least 6 characters long');
    }
    if(data['confirmPassword'] == null || data['confirmPassword']!.isEmpty) {
      return FormValidationResponse(isValid: false, message: 'Please confirm your password');
    }
    if(data['password'] != data['confirmPassword']) {
      return FormValidationResponse(isValid: false, message: 'Passwords do not match');
    }
    return FormValidationResponse(isValid: true, message: '');
  }

  static validateUserData(Map<String, dynamic> data) {
    if(data['fullName'] == null || data['fullName']!.isEmpty) {
      return FormValidationResponse(isValid: false, message: 'Please enter your full name');
    }
    if(data['fullName']!.length < 3) {
      return FormValidationResponse(isValid: false, message: 'Full name must be at least 3 characters long');
    }
    if(data['fullName']!.length > 50) {
      return FormValidationResponse(isValid: false, message: 'Full name must be less than 50 characters long');
    }
    if(data['dateOfBirth'] == null || data['dateOfBirth']!.isEmpty) {
      return FormValidationResponse(isValid: false, message: 'Please enter your date of birth');
    }

    return FormValidationResponse(isValid: true, message: '');
  }

  static validateUserPreferences(Map<String, dynamic> data) {
    if(data['likes'] == null || data['likes']!.isEmpty) {
      return FormValidationResponse(isValid: false, message: 'Please enter your likes');
    }
    if(data['likes']!.length > 100) {
      return FormValidationResponse(isValid: false, message: 'Likes must be less than 100 characters long');
    }
    if(!RegExp(r"^[a-zA-Z0-9.,\s']+").hasMatch(data['likes']!)) {
      return FormValidationResponse(isValid: false, message: 'Likes must contain only letters, numbers and spaces');
    }
    if(data['dislikes'] == null || data['dislikes']!.isEmpty) {
      return FormValidationResponse(isValid: false, message: 'Please enter your dislikes');
    }
    if(data['dislikes']!.length > 100) {
      return FormValidationResponse(isValid: false, message: 'Dislikes must be less than 100 characters long');
    }
    if(!RegExp(r"^[a-zA-Z0-9.,\s']+").hasMatch(data['dislikes']!)) {
      return FormValidationResponse(isValid: false, message: 'Dislikes must contain only letters, numbers and spaces');
    }
    if(data['avoids'] == null || data['avoids']!.isEmpty) {
      return FormValidationResponse(isValid: false, message: 'Please enter your avoids');
    }
    if(data['avoids']!.length > 100) {
      return FormValidationResponse(isValid: false, message: 'Avoids must be less than 100 characters long');
    }
    if(!RegExp(r"^[a-zA-Z0-9.,\s']+").hasMatch(data['avoids']!)) {
      return FormValidationResponse(isValid: false, message: 'Avoids must contain only letters, numbers and spaces');
    }
    if(data['diet'] == null || data['diet']!.isEmpty) {
      return FormValidationResponse(isValid: false, message: 'Please enter your diet');
    }
    if(data['diet']!.length > 100) {
      return FormValidationResponse(isValid: false, message: 'Diet must be less than 100 characters long');
    }
    if(!RegExp(r"^[a-zA-Z0-9.,\s']+").hasMatch(data['diet']!)) {
      return FormValidationResponse(isValid: false, message: 'Diet must contain only letters, numbers and spaces');
    }
    return FormValidationResponse(isValid: true, message: '');
  }
}