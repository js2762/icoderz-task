class Validation {

  static emailValidation(String value) {
    final RegExp emailRegex =
    RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    bool validateEmail(String email) {
      return emailRegex.hasMatch(email);
    }

    if (value.isEmpty) {
      //print('Please enter the E-mail');
      return 'E-mail is required';
    } else if (!validateEmail(value)) {
      //print('Enter valid E-mail');
      return 'Enter valid E-mail';
    }
  }

  static passwordValidation(String value) {
    if (value.isEmpty) {
      //print('First enter the password');
      return 'password is required';
    } else if (value.length < 6) {
      //print('password should contain atleast 6 character');
      return ('length should be atleast 6 character long');
    }
  }



}