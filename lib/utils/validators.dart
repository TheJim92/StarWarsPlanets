enum Validator { emptyField, noSymbols, none}

// Validators per i textField
class Validators {
  static String? validateField(Validator v, String? input) {
    switch (v) {
      case Validator.emptyField:
        if (input!.isEmpty) {
          return 'Compilare il campo';
        } else {
          return null;
        }
      case Validator.noSymbols:
        return 'Inserire solo valori alfanumerici';
      case Validator.none:
        return null;
    }
  }
}
