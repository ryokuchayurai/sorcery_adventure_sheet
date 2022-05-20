import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sorcery_adventure_sheet/gen/assets.gen.dart';

class Dice extends StatelessWidget {
  Dice(this.num, {this.size = 24});

  final int num;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      diceImages[num - 1],
      width: size,
      height: size,
    );
  }
}

var diceImages = [
  Assets.d1,
  Assets.d2,
  Assets.d3,
  Assets.d4,
  Assets.d5,
  Assets.d6,
];
