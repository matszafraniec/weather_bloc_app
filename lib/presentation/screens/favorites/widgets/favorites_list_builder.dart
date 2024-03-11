import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/presentation/screens/favorites/widgets/favorite_item.dart';

import '../../../../logic/cubits/favorite/favorite_cubit.dart';
import '../../../common/dimensions.dart';
import '../../../common/ui/no_items_text.dart';

class FavoritesListBuilder extends StatelessWidget {
  const FavoritesListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        final items = (state as FavoriteDataSuccess).favorites;

        if (items.isEmpty) return const NoItemsText('No favorite items');

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

            return FavoriteItem(item);
          },
        );
      },
    );
  }
}
