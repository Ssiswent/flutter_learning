import 'package:flutter/material.dart';
import 'package:flutter_learning/pages/other/animations/hero_animations/data/hero_tag.dart';
import 'package:flutter_learning/pages/other/animations/hero_animations/widgets/stars_widget.dart';

import '../hero_animations_model.dart';
import 'hero_widget.dart';

class DetailedInfoWidget extends StatelessWidget {
  final Location location;

  const DetailedInfoWidget({
    required this.location,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeroWidget(
              tag: HeroTag.addressLine1(location),
              child: Text(location.addressLine1),
            ),
            const SizedBox(height: 8),
            HeroWidget(
              tag: HeroTag.addressLine2(location),
              child: Text(location.addressLine2),
            ),
            const SizedBox(height: 8),
            HeroWidget(
              tag: HeroTag.stars(location),
              child: StarsWidget(stars: location.starRating),
            ),
          ],
        ),
      );
}
