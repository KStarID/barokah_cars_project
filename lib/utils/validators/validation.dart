// -- Validator on TextFormField

class BaroValidator {
  // -- fullname Validation
  static String? fullnameValidate(String? value){
    if (value == null || value.isEmpty){
      return 'Nama lengkap tidak boleh kosong.';
    }
    return null;
  }

  // -- Username Validation
  static String? usernameValidate(String? value){
    if (value == null || value.isEmpty){
      return 'Username tidak boleh kosong.';
    }
    return null;
  }

  // -- RegisterPassword Validation
  static String? passwordValidate(String? value){
    if (value == null || value.isEmpty){
      return 'Password tidak boleh kosong';
    } else if (value.length < 6){
        return 'Password terdiri dari minimal 6 karakter';
    }
    return null;
  }

  // -- Login Password Validation
  static String? loginPasswordValidate(String? value){
    if (value == null || value.isEmpty){
      return 'ⓘ Oops, password kamu salah';
    } else if (value.length < 6){
        return 'Password terdiri dari minimal 6 karakter';
    }
    return null;
  }

  // -- Confirm Password Validation
  static String? confirmPasswordValidate(String? value, String password){
    if (value == null || value.isEmpty){
      return 'Konfirmasi Password tidak boleh kosong';
    } else if (value.length < 6){
        return 'Password terdiri dari minimal 6 karakter';
    } else if (value != password){
      return 'Password tidak sama';
    }
    return null;
  }
}