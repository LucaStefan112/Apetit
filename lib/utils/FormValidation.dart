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
    if(data['dateOfBirth'] == null || data['dateOfBirth']!.isEmpty) {
      return FormValidationResponse(isValid: false, message: 'Please enter your date of birth');
    }
    if(data['email'] == null || data['email']!.isEmpty) {
      return FormValidationResponse(isValid: false, message: 'Please enter your email');
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
}