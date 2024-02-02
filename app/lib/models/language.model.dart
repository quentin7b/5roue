import 'package:five_wheel/gen/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

enum Language {
  @JsonValue('fr')
  fr,
  @JsonValue('en')
  en,
  @JsonValue('es')
  es,
  @JsonValue('pt')
  pt,
  @JsonValue('pl')
  pl,
  @JsonValue('ge')
  ge,
  @JsonValue('tr')
  tr,
  @JsonValue('ua')
  ua,
}

extension LanguageIcon on Language {
  Widget icon(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 32,
        minHeight: 32,
        maxWidth: 32,
        maxHeight: 32,
      ),
      child: SvgPicture.asset(
        switch (this) {
          Language.en => 'assets/images/flags/gb.svg',
          Language.fr => 'assets/images/flags/fr.svg',
          Language.es => 'assets/images/flags/es.svg',
          Language.pt => 'assets/images/flags/pt.svg',
          Language.pl => 'assets/images/flags/pl.svg',
          Language.ge => 'assets/images/flags/ge.svg',
          Language.tr => 'assets/images/flags/tr.svg',
          Language.ua => 'assets/images/flags/ua.svg',
        },
        semanticsLabel: name(context),
      ),
    );
  }
}

extension LanguageName on Language {
  String name(BuildContext context) {
    return switch (this) {
      Language.fr => Translations.of(context).languages.fr,
      Language.en => Translations.of(context).languages.en,
      Language.es => Translations.of(context).languages.es,
      Language.pt => Translations.of(context).languages.pt,
      Language.pl => Translations.of(context).languages.pl,
      Language.ge => Translations.of(context).languages.ge,
      Language.tr => Translations.of(context).languages.tr,
      Language.ua => Translations.of(context).languages.ua
    };
  }
}

extension LanguageShortName on Language {
  String get shortName {
    return switch (this) {
      Language.fr => 'fr',
      Language.en => 'en',
      Language.es => 'es',
      Language.pt => 'pt',
      Language.pl => 'pl',
      Language.ge => 'ge',
      Language.tr => 'tr',
      Language.ua => 'ua'
    };
  }
}
