import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: SvgPicture.asset(
          'assets/images/logo_gobhidalgo.svg',
          height: 20,
        ),
      ),
    );
  }
}
