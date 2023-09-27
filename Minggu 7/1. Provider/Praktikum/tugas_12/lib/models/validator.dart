class Validator {
  String? validateName(String? value) {
    if (value?.isEmpty ?? false) {
      return 'Nama harus di isi';
    }
    List<String>? words = value?.trim().split(" ");
    if ((words?.length ?? 0) < 2) {
      return 'Nama harus terdiri dari minimal 2 kata';
    }
    if (words != null) {
      for (int i = 0; i < words.length; i++) {
        if (words[i] != "" && words[i][0] != words[i][0].toUpperCase()) {
          return 'Setiap kata harus dimulai dengan huruf kapital';
        }
      }
    }
    RegExp regex = RegExp(r'^[a-zA-Z\s]+$');
    if (!regex.hasMatch(value ?? "")) {
      return 'Nama tidak boleh mengandung angka atau karakter khusus';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value?.isEmpty ?? false) {
      return 'Nomor telepon harus di isi';
    }
    if ((value?.length ?? 0) <= 8) {
      return 'Panjang nomor telepon harus minimal 8 digit';
    }
    if ((value?.length ?? 0) >= 15) {
      return 'Panjang nomor telepon maksimal 15 digit';
    }
    if (value?[0] != "0") {
      return 'Nomor telepon harus dimulai dengan angka 0';
    }
    RegExp regex = RegExp(r'^[0-9]+$');
    if (!regex.hasMatch(value ?? "")) {
      return 'Nomor telepon harus terdiri dari angka saja';
    }
    return null;
  }
}
