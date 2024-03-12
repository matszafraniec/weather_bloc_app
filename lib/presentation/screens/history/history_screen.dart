import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/logic/cubits/history/history_cubit.dart';
import 'package:weather_bloc_app/presentation/common/context_extensions.dart';
import 'package:weather_bloc_app/presentation/common/dimensions.dart';
import 'package:weather_bloc_app/presentation/common/ui/error_icon_big.dart';
import 'package:weather_bloc_app/presentation/dialogs/history_data_preview_dialog.dart';

import '../../../data/models/weather_current_conditions/domain/weather_conditions_history.dart';
import '../../common/ui/empty_app_bar.dart';
import 'widgets/history_list_builder.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: Dimensions.paddingL),
        child: BlocConsumer<HistoryCubit, HistoryState>(
          listener: _handleSideEffects,
          builder: (context, state) {
            if (state is HistoryInitial || state is HistoryDataLoading) {
              return const CircularProgressIndicator();
            } else if (state is HistoryDataSuccess) {
              return const HistoryListBuilder();
            } else if (state is HistoryDataError) {
              return const ErrorIconBig();
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }

  void _handleSideEffects(BuildContext context, HistoryState state) {
    if (state is HistoryDataError) {
      _snackbarError(context, state.error.message);
    } else if (state is HistoryDataSuccess && state.itemPreview != null) {
      _showHistoryDataPreviewDialog(context, state.itemPreview!);
    }
  }

  void _snackbarError(BuildContext context, String message) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: context.themeColors.error,
          content: Text(message),
        ),
      );

  void _showHistoryDataPreviewDialog(
          BuildContext context, WeatherConditionsHistory item) =>
      showDialog(
        context: context,
        builder: (builderContext) => HistoryDataPreviewDialog(
          item,
          onDismiss: context.read<HistoryCubit>().onPreviewDismiss,
        ),
      );
}
