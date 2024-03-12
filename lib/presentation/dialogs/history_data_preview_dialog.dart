import 'package:flutter/material.dart';
import 'package:weather_bloc_app/presentation/common/context_extensions.dart';

import '../../data/models/weather_current_conditions/domain/weather_conditions_history.dart';
import '../common/dimensions.dart';
import '../common/ui/weather_icon.dart';
import '../screens/home/widgets/city_forecast_widgets/current_weather_conditions.dart';

class HistoryDataPreviewDialog extends StatelessWidget {
  final WeatherConditionsHistory item;
  final VoidCallback onDismiss;

  const HistoryDataPreviewDialog(
    this.item, {
    required this.onDismiss,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        onDismiss();
        return true;
      },
      child: Dialog(
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: context.themeColors.onTertiary,
              borderRadius: BorderRadius.circular(8)),
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LastSeenAtInfo(item.lastSeenAtFormatted),
                  Padding(
                    padding: const EdgeInsetsDirectional.symmetric(
                      vertical: Dimensions.paddingXL,
                      horizontal: Dimensions.paddingXM,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CityLocationInfo(
                              item.conditions.locationInfo,
                            ),
                            WheaterIcon.big(
                              value: item.conditions.icon,
                            ),
                          ],
                        ),
                        const Divider(
                          height: Dimensions.paddingXXL,
                        ),
                        CurrentConditionsInfo(item.conditions),
                      ],
                    ),
                  ),
                ],
              ),
              PositionedDirectional(
                top: -4,
                end: -4,
                child: CloseButton(
                  color: context.themeColors.error,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LastSeenAtInfo extends StatelessWidget {
  final String lastSeenAt;

  const LastSeenAtInfo(this.lastSeenAt, {super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.themeColors.onSurfaceVariant,
          borderRadius: const BorderRadiusDirectional.horizontal(
            start: Radius.circular(2),
            end: Radius.circular(2),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingS),
          child: Text(
            lastSeenAt,
            style: context.themeTexts.labelSmall!.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
