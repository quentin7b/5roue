import 'dart:async';

import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  final Duration delayBetweenUpdates;
  final Function(String)? onSearch;

  const SearchField({
    super.key,
    this.onSearch,
    this.delayBetweenUpdates = const Duration(milliseconds: 200),
  });

  @override
  State<SearchField> createState() => SearchFieldState();
}

class SearchFieldState extends State<SearchField> {
  late TextEditingController _controller;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onSearch(String value) {
    if (widget.onSearch != null) {
      _debounceTimer?.cancel();
      _debounceTimer = Timer(widget.delayBetweenUpdates, () {
        widget.onSearch!(value);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: _onSearch,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 1),
          borderRadius: BorderRadius.circular(6),
        ),
        hintText: 'Rechercher un jeu',
        filled: false,
        suffixIcon: IconButton(
          icon: Icon(Icons.search, color: Theme.of(context).primaryColor),
          onPressed: () => _onSearch(_controller.text),
        ),
      ),
    );
  }
}
