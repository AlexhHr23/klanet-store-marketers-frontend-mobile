import 'package:formz/formz.dart';

// Define input validation errors
enum CodeError { length }

// Extend FormzInput and provide the input type and error type.
class Code extends FormzInput<String, CodeError> {
  // static final RegExp passwordRegExp = RegExp(r'^[a-zA-Z]+$');

  // Call super.pure to represent an unmodified form input.
  const Code.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Code.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;

    // if (displayError == TextError.empty) return 'El campo es requerido';
    if (displayError == CodeError.length) return 'Mínimo 3 caracteres';
    // if (displayError == TextError.format) return 'Debe de tener solo letras';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  CodeError? validator(String value) {
    // if (value.isEmpty || value.trim().isEmpty) return TextError.empty;
    if (value.length < 3) return CodeError.length;
    // if (!passwordRegExp.hasMatch(value)) return TextError.format;

    return null;
  }
}
