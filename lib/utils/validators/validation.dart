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
      return 'ⓘ Oops, password kamu salah';
    } else if (value.length < 6){
        return 'Password terdiri dari minimal 6 karakter';
    }
    return null;
  }
}