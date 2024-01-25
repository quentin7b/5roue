import 'package:five_wheel/gen/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

enum Language {
  @JsonValue('fr')
  fr,
  @JsonValue('en')
  en,
}

extension LanguageIcon on Language {
  String get icon {
    switch (this) {
      case Language.fr:
        return '🇫🇷';
      case Language.en:
        return '🇬🇧';
    }
  }
}

extension LanguageName on Language {
  String name(BuildContext context) {
    switch (this) {
      case Language.fr:
        return Translations.of(context).languages.fr;
      case Language.en:
        return Translations.of(context).languages.en;
    }
  }
}

extension LanguageShortName on Language {
  String get shortName {
    switch (this) {
      case Language.fr:
        return 'fr';
      case Language.en:
        return 'en';
    }
  }
}
