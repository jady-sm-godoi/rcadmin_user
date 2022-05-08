import 'package:flutter/material.dart';

class ValidatorsForm {
  bool validateLenghtInput(String text, int tamanho) {
    bool _isNotEmpty = text.trim().isNotEmpty;
    bool _hasGoodLenght = text.trim().length >= tamanho;

    return _isNotEmpty && _hasGoodLenght;
  }

  String? validateName(String? value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = RegExp(patttern);

    final _value = value ?? '';

    if (!validateLenghtInput(_value, 2)) {
      return 'Insira uma nome válido!';
    }
    if (!regExp.hasMatch(value!)) {
      return "O nome deve conter caracteres de a-z ou A-Z";
    }
    return null;
  }

  String? validateMobile(String? value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(patttern);

    final _value = value ?? '';

    if (_value.trim().isEmpty) {
      return "Informe o celular";
    }
    if (_value.length != 11) {
      return "O celular deve ter 11 dígitos";
    }
    if (!regExp.hasMatch(_value)) {
      return "O número do celular so deve conter dígitos";
    }
    return null;
  }

  String? validatePhone(String? value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(patttern);

    final _value = value ?? '';

    if (_value.trim().isEmpty) {
      return "Informe o número do telefone";
    }
    if (_value.length != 10) {
      return "O telefone deve ter 10 dígitos";
    }
    if (!regExp.hasMatch(_value)) {
      return "O número do telefone so deve conter dígitos";
    }
    return null;
  }

  String? validarEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);

    final _value = value ?? '';

    if (_value.trim().isEmpty) {
      return "Informe o Email";
    }
    if (!regExp.hasMatch(_value)) {
      return "Email inválido";
    }
    return null;
  }

//TERMINAR FUNÇÃO...
  // String? validatorSOSContact(
  //   String? value,
  //   TextEditingController sosPhoneController,
  // ) {
  //   final _value = value ?? '';

  //   if (sosPhoneController.text.isNotEmpty) {
  //     return 'Informe o nome do seu contato de emergência.';
  //   }
  // }
}
