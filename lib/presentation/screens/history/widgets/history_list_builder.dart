import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/logic/cubits/history/history_cubit.dart';
import 'package:weather_bloc_app/presentation/common/ui/no_items_text.dart';
import 'package:weather_bloc_app/presentation/screens/history/widgets/history_item.dart';

import '../../../common/dimensions.dart';

class HistoryListBuilder extends StatelessWidget {
  const HistoryListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (context, state) {
        final items = (state as HistoryDataSuccess).historyItems;

        if (items.isEmpty) return const NoItemsText('No history items');

        return const HistoryList();
      },
    );
  }
}

class HistoryList extends StatelessWidget {
  const HistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (context, state) {
        final items = (state as HistoryDataSuccess).historyItems;

        return ListView.separated(
          itemCount: items.length,
          separatorBuilder: (_, __) =>
              const SizedBox(height: Dimensions.paddingL),
          itemBuilder: (context, index) {
            final item = items[index];

            return HistoryItem(item);
          },
        );
      },
    );
  }
}
