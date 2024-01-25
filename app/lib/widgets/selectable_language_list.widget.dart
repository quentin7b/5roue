import 'package:five_wheel/models/language.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _selectedLanguagesProvider = StateProvider<List<Language>>((ref) => []);

class SelectableLanguagesList extends ConsumerWidget {
  final Function(List<Language> languages) onChange;

  const SelectableLanguagesList({
    super.key,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languages = Language.values;
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: languages.length,
            itemBuilder: (context, index) {
              final language = languages[index];
              return CheckboxListTile(
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      language.icon,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(width: 8),
                    Text(language.name(context)),
                  ],
                ),
                value: ref.watch(_selectedLanguagesProvider).contains(language),
                onChanged: (value) {
                  final originalList =
                      ref.read(_selectedLanguagesProvider.notifier).state;
                  if (value != null && value) {
                    ref.read(_selectedLanguagesProvider.notifier).state = [
                      ...ref.watch(_selectedLanguagesProvider),
                      language,
                    ];
                  } else {
                    ref.read(_selectedLanguagesProvider.notifier).state =
                        originalList
                            .where((element) => element != language)
                            .toList();
                  }
                },
              );
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            onChange(ref.read(_selectedLanguagesProvider));
          },
          child: const Text('Apply'),
        ),
      ],
    );
  }
}
