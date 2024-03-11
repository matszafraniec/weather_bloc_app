import 'package:flutter/material.dart';
import 'package:weather_bloc_app/presentation/common/context_extensions.dart';

class NoItemsText extends StatelessWidget {
  final String text;

  const NoItemsText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      child: Row(
        children: [
          const CustomDivider(padding: EdgeInsetsDirectional.only(end: 10)),
          Expanded(
            flex: 3,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: context.themeTexts.bodyLarge,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const CustomDivider(padding: EdgeInsetsDirectional.only(start: 10)),
        ],
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  final EdgeInsetsGeometry padding;

  const CustomDivider({
    required this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: padding,
        child: Container(
          height: 1,
          color: context.themeColors.primary,
        ),
      ),
    );
  }
}
