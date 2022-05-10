import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

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

  String? validatePhone(String? value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(patttern);

    final _value = value ?? '';

    if (_value.trim().isEmpty) {
      return "Informe o número do telefone";
    }
    if (_value.length < 10) {
      return "O telefone deve ter no mínimo 10 dígitos";
    }
    if (!regExp.hasMatch(_value)) {
      return "O número do telefone so deve conter dígitos";
    }
    return null;
  }

  String? validateEmail(String? value) {
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

  bool isValidDate(String date) {
    try {
      DateTime.parse(date);
      return true;
    } catch (e) {
      return false;
    }
  }

  String? validateDate(String? value) {
    final _value = value?.replaceAll('/', '');
    final date = _value ?? '';

    if (date.trim().isEmpty) {
      return "data é obrigatória";
    }
    if (!isValidDate(date)) {
      return 'data inválida! ';
    }
    return null;
  }
}
