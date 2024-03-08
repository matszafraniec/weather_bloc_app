import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/logic/cubits/weather/weather_cubit.dart';
import 'package:weather_bloc_app/presentation/common/app_theme.dart';
import 'package:weather_bloc_app/presentation/common/context_extensions.dart';
import 'package:weather_bloc_app/presentation/common/dimensions.dart';

class CitySearchBar extends StatefulWidget {
  const CitySearchBar({
    super.key,
  });

  @override
  State<CitySearchBar> createState() => _CitySearchBarState();
}

class _CitySearchBarState extends State<CitySearchBar> {
  bool showProceedButton = false;
  String searchPhrase = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingXL),
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) => TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            border: AppTheme.defaultInputBorder,
            enabledBorder: AppTheme.defaultInputBorder.copyWith(
              borderSide: BorderSide(color: context.themeColors.primary),
            ),
            hintText: 'Input city name',
            suffixIcon: _buildSuffixIcon(state),
          ),
          onChanged: _onTextChanged,
          onFieldSubmitted: (_) => _onSearchSubmitted(),
          validator: (value) {
            if (value!.length >= 4) {
              return null;
            }

            return 'Input at least 4 characters';
          },
        ),
      ),
    );
  }

  Widget _buildSuffixIcon(WeatherState state) {
    if (state is WeatherInitial ||
        state is WeatherCitySearchError ||
        state is WeatherCitySearchSuccess) {
      if (showProceedButton) {
        return ProceedButton(
          onPressed: _onSearchSubmitted,
        );
      }

      return const SizedBox();
    } else if (state is WeatherCitySearchStart) {
      return const ProgressIndicator();
    }

    return const SizedBox();
  }

  void _onTextChanged(String value) {
    searchPhrase = value;
    setState(() => showProceedButton = value.length >= 4);
  }

  void _onSearchSubmitted() async =>
      await context.read<WeatherCubit>().onSearchSubmitted(searchPhrase);
}

class ProceedButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ProceedButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.check_circle,
        color: context.themeColors.primary,
      ),
      onPressed: onPressed,
    );
  }
}

class ProgressIndicator extends StatelessWidget {
  const ProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const UnconstrainedBox(
      child: SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      ),
    );
  }
}
