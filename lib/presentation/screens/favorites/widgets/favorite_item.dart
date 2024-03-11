import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/presentation/common/context_extensions.dart';

import '../../../../data/models/weather_current_conditions/domain/location_info.dart';
import '../../../../logic/cubits/favorite/favorite_cubit.dart';
import '../../../common/dimensions.dart';

class FavoriteItem extends StatelessWidget {
  final LocationInfo item;

  const FavoriteItem(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingS),
      child: Card(
        color: context.themeColors.onPrimary,
        child: InkWell(
          onTap: () => context.read<FavoriteCubit>().onItemTap(item),
          child: Padding(
            padding: const EdgeInsetsDirectional.only(
              start: Dimensions.paddingL,
              end: Dimensions.paddingS,
              top: Dimensions.paddingXM,
              bottom: Dimensions.paddingXM,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.city,
                      style: context.themeTexts.headlineMedium,
                    ),
                    Text(item.area),
                  ],
                ),
                DeleteIcon(
                  onPressed: () async =>
                      await context.read<FavoriteCubit>().onItemDelete(item),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DeleteIcon extends StatelessWidget {
  final VoidCallback onPressed;

  const DeleteIcon({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(Dimensions.paddingXS),
      constraints: const BoxConstraints(),
      icon: Icon(
        Icons.delete,
        color: context.themeColors.error,
      ),
      onPressed: onPressed,
    );
  }
}
