// -- Validator on TextFormField

class BaroValidator {
  // -- Username Validation
  static String? usernameValidate(String? value){
    if (value == null || value.isEmpty){
      return 'Username tidak boleh kosong.';
    }
    return null;
  }

  // -- Password Validation
  static String? passwordValidate(String? value){
    if (value == null || value.isEmpty){
      return 'Password tidak boleh kosong.';
    }
    return null;
  }
}