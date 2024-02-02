import 'package:five_wheel/gen/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

enum Language {
  @JsonValue('fr')
  fr,
  @JsonValue('en')
  en,
}

extension LanguageIcon on Language {
  Widget icon(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 32,
        maxHeight: 32,
      ),
      child: SvgPicture.asset(
        switch (this) {
          Language.en => 'assets/images/flags/gb.svg',
          Language.fr => 'assets/images/flags/fr.svg',
        },
        semanticsLabel: name(context),
      ),
    );
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
