import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/logic/cubits/history/history_cubit.dart';
import 'package:weather_bloc_app/presentation/common/context_extensions.dart';
import 'package:weather_bloc_app/presentation/common/dimensions.dart';

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
        child: BlocBuilder<HistoryCubit, HistoryState>(
          builder: (context, state) {
            if (state is HistoryInitial || state is HistoryDataLoading) {
              return const CircularProgressIndicator();
            } else if (state is HistoryDataSuccess) {
              return const HistoryListBuilder();
            } else {
              return Icon(
                Icons.error,
                color: context.themeColors.error,
              );
            }
          },
        ),
      ),
    );
  }
}
