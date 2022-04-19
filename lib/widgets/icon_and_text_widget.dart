import 'package:flutter/cupertino.dart';
import 'package:food_app/widgets/small_text.dart';

import '../utils/dimensions.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final double size;
  final Color iconColor;

  const IconAndTextWidget(
      {Key? key,
      required this.icon,
      required this.text,
      required this.size,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimensions.ratio * 15,
        ),
        SizedBox(width: Dimensions.ratio * 5),
        SmallText(
          text: text,
          size: Dimensions.ratio * 12,
        )
      ],
    );
  }
}
