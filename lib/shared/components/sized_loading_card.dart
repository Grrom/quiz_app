import 'package:flutter/cupertino.dart';
import 'package:stamp_card/shared/constants/custom_colors.dart';

class SizedLoadingCard extends StatelessWidget {
  final double height;
  final double width;

  const SizedLoadingCard({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Container(
        decoration: BoxDecoration(
          color: CustomColors.backgroundDisabled,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: CupertinoActivityIndicator(),
        ),
      ),
    );
  }
}
