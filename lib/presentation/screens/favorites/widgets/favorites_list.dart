import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/presentation/common/context_extensions.dart';

import '../../../../logic/cubits/favorite/favorite_cubit.dart';
import '../../../common/dimensions.dart';

class FavoritesListBuilder extends StatelessWidget {
  const FavoritesListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        final items = (state as FavoriteDataSuccess).favorites;

        if (items.isEmpty) return const Text('No favorite items');

        return const FavoritesList();
      },
    );
  }
}

class FavoritesList extends StatelessWidget {
  const FavoritesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        final items = (state as FavoriteDataSuccess).favorites;

        return ListView.separated(
          itemCount: items.length,
          separatorBuilder: (_, __) =>
              const SizedBox(height: Dimensions.paddingL),
          itemBuilder: (context, index) {
            final item = items[index];

            return ListTile(
              title: Text(
                item.city,
                style: context.themeTexts.headlineMedium,
              ),
              subtitle: Column(
                children: [
                  Text(item.area),
                  Padding(
                    padding: const EdgeInsets.only(top: Dimensions.paddingS),
                    child: Text(item.country),
                  ),
                ],
              ),
              trailing: FavoriteIcon(
                onPressed: () async =>
                    await context.read<FavoriteCubit>().onFavoriteDelete(item),
              ),
            );
          },
        );
      },
    );
  }
}

class FavoriteIcon extends StatelessWidget {
  final VoidCallback onPressed;

  const FavoriteIcon({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(Dimensions.paddingXS),
      constraints: const BoxConstraints(),
      icon: Icon(
        Icons.favorite,
        color: context.themeColors.error,
      ),
      onPressed: onPressed,
    );
  }
}
