// -- Validator on TextFormField

class BaroValidator {
  // -- fullname Validation
  static String? nameValidate(String? value){
    if (value == null || value.isEmpty){
      return 'Nama tidak boleh kosong.';
    }
    return null;
  }

  // -- Email Validation
  static bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
    }

  static String? emailValidate(String? value){
    if (value == null || value.isEmpty){
      return 'Email tidak boleh kosong.';
    } else if (!isValidEmail(value)){
      return 'Silahkan masukkan format email yang valid';
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

  // -- Merk Validation
  static String? merkValidation(String? value){
    if (value == null || value.isEmpty){
      return 'Merk tidak boleh kosong';
    } else if (value.length <= 2 ){
      return 'Merk mobil harus terdiri dari minimal 2 karakter';
    }
    return null;
  }

  // -- Model Validation
  static String? modelValidation(String? value){
    if (value == null || value.isEmpty){
      return 'Model tidak boleh kosong';
    } else if (value.length <= 2){
      return 'Model harus terdiri dari minimal 2 karakter';
    }
    final validCharacters = RegExp(r'^[a-zA-Z0-9\s\-]+$');
    if (!validCharacters.hasMatch(value)) {
      return 'Model mobil hanya boleh mengandung huruf, angka, spasi, dan tanda hubung';
    }
    return null;
  }

  // -- Bahan Bakar Validation
  static String? bahanBakarValidation (String? value){
    if (value == null || value.isEmpty){
      return 'Bahan bakar tidak boleh kosong';
    }
    return null;
  }

  // -- Transmisi Validation
  static String? transmisiValidation (String? value){
    if (value == null || value.isEmpty){
      return 'Bahan bakar tidak boleh kosong';
    }
    return null;
  }

  // -- Harga Jual Validation
  static String? hargaJualValidate(String? value){
    if (value == null || value.isEmpty){
      return 'Harga jual tidak boleh kosong';
    }
    final price = int.tryParse(value);
    if (price == null || price <= 0){
      return 'Harga jual harus berupa angka';
    }
    return null;
  }

  // -- Narahubung Validation
  static String? narahubungValidation (String? value){
    if (value == null || value.isEmpty){
      return 'Narahubung tidak boleh kosong';
    } else if (value.length < 10 || value.length > 15){
      return 'Kontak harus terdiri dari 10 hingga 15 karakter';
    }final validCharacters = RegExp(r'^[0-9]+$');
    if (!validCharacters.hasMatch(value)) {
      return 'Kontak penjual hanya boleh mengandung angka';
    }
    return null;
  }

  // -- Deskripsi Validation
  static String? deskripsiValidation (String? value){
    if (value == null || value.isEmpty){
      return 'Deskripsi tidak boleh kosong';
    }
    return null;
  }

  // -- Tahun Pembuatan Validation
  static String? tahunPembuatanValidation (String? value){
    if (value == null || value.isEmpty){
      return 'Tahun Pembuatan tidak boleh kosong';
    } else if (value.length != 4){
      return 'Format tahun yang anda masukkan tidak valid';
    }
    return null;
  }

  // -- Warna Validation
  static String? warnaValidation (String? value){
    if (value == null || value.isEmpty){
      return 'Tahun Pembuatan tidak boleh kosong';
    } else if (value.length <= 3){
      return 'Warna terdiri dari minimal 3 karakter';
    }
    return null;
  }
}