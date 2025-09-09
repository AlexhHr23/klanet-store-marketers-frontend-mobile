import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:klanet_store_marketters_frontend_mobile/features/shared/infrastructure/inputs/inputs.dart';

class RegisterFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final TextInput name;
  final TextInput lastName;
  final Email email;
  final String phoneNumber;
  final String telIso;
  final String telCode;
  final Password password;
  final String repeatPassword;
  final Code? code;

  RegisterFormState({
    this.isPosting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.name = const TextInput.pure(),
    this.lastName = const TextInput.pure(),
    this.email = const Email.pure(),
    this.phoneNumber = '',
    this.telIso = '',
    this.telCode = '',
    this.password = const Password.pure(),
    this.repeatPassword = '',
    this.code = const Code.pure(),
  });

  RegisterFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    TextInput? name,
    TextInput? lastName,
    Email? email,
    String? phoneNumber,
    String? telIso,
    String? telCode,
    Password? password,
    String? repeatPassword,
    Code? code,
  }) => RegisterFormState(
    isPosting: isPosting ?? this.isPosting,
    isFormPosted: isFormPosted ?? this.isFormPosted,
    isValid: isValid ?? this.isValid,
    name: name ?? this.name,
    lastName: lastName ?? this.lastName,
    email: email ?? this.email,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    telIso: telIso ?? this.telIso,
    telCode: telCode ?? this.telCode,
    password: password ?? this.password,
    repeatPassword: repeatPassword ?? this.repeatPassword,
    code: code ?? this.code,
  );
  @override
  String toString() {
    return '''
    RegisterFormState:
      isPosting: $isPosting,
      isFormPosted: $isFormPosted,
      isValid: $isValid,
      name: $name,
      lastName: $lastName,
      email: $email,
      phoneNumber: $phoneNumber,
      password: $password,
      repeatPassword: $repeatPassword,
      code: $code,
    }
    ''';
  }
}

class RegisterFormNotifier extends StateNotifier<RegisterFormState> {
  RegisterFormNotifier() : super(RegisterFormState());

  onNameChange(String value) {
    final newName = TextInput.dirty(value);
    state = state.copyWith(
      name: newName,
      isValid: Formz.validate([newName, state.lastName, state.email]),
    );
  }

  onLastNameChange(String value) {
    final newLastName = TextInput.dirty(value);
    state = state.copyWith(
      lastName: newLastName,
      isValid: Formz.validate([newLastName, state.name, state.email]),
    );
  }

  onEmailChange(String value) {
    final newEmail = Email.dirty(value);
    state = state.copyWith(
      email: newEmail,
      isValid: Formz.validate([newEmail, state.password]),
    );
  }

  onPasswordChange(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
      password: newPassword,
      isValid: Formz.validate([state.email, newPassword]),
    );
  }

  onFormSubmit() {
    _touchEveryField();
    if (!state.isValid) return;
    print(state);
  }

  _touchEveryField() {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    state = state.copyWith(
      email: email,
      password: password,
      isValid: Formz.validate([email, password]),
    );
  }
}

final registerFormProvider =
    StateNotifierProvider.autoDispose<RegisterFormNotifier, RegisterFormState>((
      ref,
    ) {
      return RegisterFormNotifier();
    });
