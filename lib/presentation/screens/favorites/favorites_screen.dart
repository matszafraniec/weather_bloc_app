import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/presentation/common/context_extensions.dart';

import '../../../logic/cubits/favorite/favorite_cubit.dart';
import '../../common/ui/empty_app_bar.dart';
import 'widgets/favorites_list_builder.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppBar(),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteInitial || state is FavoriteDataLoading) {
            return const CircularProgressIndicator();
          } else if (state is FavoriteDataSuccess) {
            return const FavoritesListBuilder();
          } else {
            return Icon(
              Icons.error,
              color: context.themeColors.error,
            );
          }
        },
      ),
    );
  }
}
