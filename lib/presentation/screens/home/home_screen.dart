import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/presentation/common/context_extensions.dart';
import 'package:weather_bloc_app/presentation/common/ui/empty_app_bar.dart';

import '../../../logic/cubits/network_status/network_status_cubit.dart';
import '../../../logic/cubits/weather/weather_cubit.dart';
import '../../common/dimensions.dart';
import '../../common/ui/dialog_helper.dart';
import 'widgets/city_forecast_widgets/city_forecast_layout.dart';
import 'widgets/city_search_widgets/city_search_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppBar(),
      body: BlocListener<NetworkStatusCubit, NetworkStatusState>(
        listener: _handleNetworkStatusInfo,
        listenWhen: (previous, current) => previous != current,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<WeatherCubit, WeatherState>(
              builder: (context, state) => _buildBackButton(state),
            ),
            Expanded(
              child: BlocConsumer<WeatherCubit, WeatherState>(
                listener: _handleSideEffects,
                builder: (context, state) {
                  if (state is WeatherInitial || state is WeatherCitySearch) {
                    return const CitySearchLayout();
                  } else if (state is WeatherCityData) {
                    return const CityForecastLayout();
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton(WeatherState state) {
    if (state is WeatherCityData) {
      return const CustomBackButton();
    }

    return const SizedBox();
  }

  void _handleNetworkStatusInfo(
      BuildContext context, NetworkStatusState state) {
    if (state is NetworkStatusDisconnected) {
      DialogHelper.of(context).show(
        title: 'Network disconnected',
        icon: Icons.wifi_off,
      );
    }
  }

  void _handleSideEffects(BuildContext context, WeatherState state) {
    if (state is WeatherCitySearchError) {
      _snackbarError(context, state.error.message);
    } else if (state is WeatherCityDataError) {
      _snackbarError(context, state.error.message);
    } else if (state is WeatherCityDataSuccess) {
      if (state.isAddedToFavorites) {
        _snackbarSuccess(context);
      }
    }
  }

  void _snackbarError(BuildContext context, String message) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: context.themeColors.error,
          content: Text(message),
        ),
      );

  void _snackbarSuccess(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.blue,
        content: Text('Added to favorites'),
      ),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: Dimensions.paddingS),
      child: BackButton(
        onPressed: () => context.read<WeatherCubit>().onBackButtonPressed(),
      ),
    );
  }
}
