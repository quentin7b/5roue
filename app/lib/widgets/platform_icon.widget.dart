import 'package:five_wheel/models/platform.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlatformIcon extends StatelessWidget {
  final Platform platform;

  PlatformIcon({
    super.key,
    required this.platform,
  });

  @override
  Widget build(BuildContext context) {
    late String assetName;
    switch (platform) {
      case Platform.steam:
        assetName = 'assets/images/icons/ic_steam.svg';
        break;
      case Platform.psn:
        assetName = 'assets/images/icons/ic_psn.svg';
        break;
      case Platform.xbox:
        assetName = 'assets/images/icons/ic_xbox.svg';
        break;
      case Platform.windows:
        assetName = 'assets/images/icons/ic_windows.svg';
        break;
      case Platform.riot:
        assetName = 'assets/images/icons/ic_riot.svg';
        break;
      case Platform.epic:
        assetName = 'assets/images/icons/ic_epic.svg';
        break;
      case Platform.ea:
        assetName = 'assets/images/icons/ic_ea.svg';
        break;
      case Platform.nintendo:
        assetName = 'assets/images/icons/ic_nintendo.svg';
        break;
    }
    return SvgPicture.asset(
      assetName,
      semanticsLabel: platform.toString(),
      width: 32,
    );
  }
}
