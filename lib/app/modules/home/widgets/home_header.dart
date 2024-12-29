import 'package:flutter/material.dart';

import '../../../utils/constants/image_strings.dart';

class BaroHomeHeader extends StatelessWidget {
  const BaroHomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(BaroImages.appLogo))
        ],
      ),
    );
  }
}
