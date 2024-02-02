import 'package:flutter/material.dart';

class RoundedBackButton extends StatelessWidget {
  final VoidCallback? onTap;

  const RoundedBackButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, left: 8),
      child: ClipOval(
        child: Material(
          color: Colors.white.withOpacity(.7),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: onTap,
          ),
        ),
      ),
    );
  }
}
