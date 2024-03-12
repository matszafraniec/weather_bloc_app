import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/domain/location_info.dart';
import 'package:weather_bloc_app/logic/cubits/history/history_cubit.dart';
import 'package:weather_bloc_app/presentation/common/context_extensions.dart';

import '../../../../data/models/weather_current_conditions/domain/weather_conditions_history.dart';
import '../../../../data/models/weather_current_conditions/domain/weather_current_conditions.dart';
import '../../../common/dimensions.dart';
import '../../../common/ui/weather_icon.dart';

class HistoryItem extends StatelessWidget {
  final WeatherConditionsHistory item;

  const HistoryItem(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingS),
      child: Card(
        color: context.themeColors.onPrimary,
        child: InkWell(
          onTap: () => context.read<HistoryCubit>().onItemTap(item),
          child: Column(
            children: [
              LastSeenAtInfo(item.lastSeenAtFormatted),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: Dimensions.paddingL,
                  end: Dimensions.paddingS,
                  bottom: Dimensions.paddingXM,
                  top: Dimensions.paddingS,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CityLocationInfo(item.conditions.locationInfo),
                    WheaterConditionsInfo(item.conditions),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CityLocationInfo extends StatelessWidget {
  final LocationInfo locationInfo;

  const CityLocationInfo(this.locationInfo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          locationInfo.city,
          style: context.themeTexts.labelLarge,
        ),
        Text(locationInfo.area),
      ],
    );
  }
}

class WheaterConditionsInfo extends StatelessWidget {
  final WeatherCurrentConditions conditionsInfo;

  const WheaterConditionsInfo(this.conditionsInfo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            WheaterIcon.small(value: conditionsInfo.icon),
            Padding(
              padding:
                  const EdgeInsetsDirectional.only(start: Dimensions.paddingXS),
              child: RichText(
                text: TextSpan(
                  style: context.themeTexts.bodyMedium,
                  children: [
                    TextSpan(
                      text: '${conditionsInfo.regularTemperature}',
                    ),
                    TextSpan(
                      text: '°C',
                      style: context.themeTexts.bodySmall,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class LastSeenAtInfo extends StatelessWidget {
  final String lastSeenAt;

  const LastSeenAtInfo(this.lastSeenAt, {super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomEnd,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: context.themeColors.onSurfaceVariant,
            borderRadius:
                const BorderRadiusDirectional.only(topEnd: Radius.circular(8))),
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
