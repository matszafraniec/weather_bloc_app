import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/presentation/common/context_extensions.dart';
import 'package:weather_bloc_app/presentation/common/dimensions.dart';
import 'package:weather_bloc_app/presentation/common/ui/error_icon_big.dart';

import '../../../logic/cubits/favorite/favorite_cubit.dart';
import '../../common/ui/empty_app_bar.dart';
import 'widgets/favorites_list_builder.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: Dimensions.paddingL),
        child: BlocConsumer<FavoriteCubit, FavoriteState>(
          listener: _handleSideEffects,
          builder: (context, state) {
            if (state is FavoriteInitial || state is FavoriteDataLoading) {
              return const CircularProgressIndicator();
            } else if (state is FavoriteDataSuccess) {
              return const FavoritesListBuilder();
            } else if (state is FavoriteDataError) {
              return const ErrorIconBig();
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }

  void _handleSideEffects(BuildContext context, FavoriteState state) {
    if (state is FavoriteDataError) {
      _snackbarError(context, state.error.message);
    }
  }

  void _snackbarError(BuildContext context, String message) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: context.themeColors.error,
          content: Text(message),
        ),
      );
}
