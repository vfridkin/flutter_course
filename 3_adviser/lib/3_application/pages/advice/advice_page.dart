import 'package:adviser/3_application/core/services/theme_service.dart';
import 'package:adviser/3_application/pages/advice/widgets/advice_field.dart';
import 'package:adviser/3_application/pages/advice/widgets/custom_button.dart';
import 'package:adviser/3_application/pages/advice/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'bloc/adviser_bloc.dart';

class AdvicePageWrapperProvider extends StatelessWidget {
  const AdvicePageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdviserBloc(),
      child: const AdvicePage(),
    );
  }
}

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Adviser',
          style: themeData.textTheme.headline1,
        ),
        centerTitle: true,
        actions: [
          Switch(
              value: Provider.of<ThemeService>(context).isDarkModeOn,
              onChanged: (_) {
                Provider.of<ThemeService>(context, listen: false).toggleTheme();
              }),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: [
              Expanded(child: Center(
                child: BlocBuilder<AdviserBloc, AdviserState>(
                  builder: (context, state) {
                    if (state is AdviserInitial) {
                      return Text(
                        'When you\'re ready!',
                        style: themeData.textTheme.headline1,
                      );
                    }
                    if (state is AdviserStateLoading) {
                      return CircularProgressIndicator(
                        color: themeData.colorScheme.secondary,
                      );
                    }
                    if (state is AdviserStateLoaded) {
                      return AdviceField(
                        advice: state.advice,
                      );
                    }
                    if (state is AdviserStateError) {
                      return ErrorMessage(
                        message: state.message,
                      );
                    }
                    return const SizedBox();
                  },
                ),
              )),
              const SizedBox(
                height: 200,
                child: Center(child: CustomButton()),
              ),
            ],
          )),
    );
  }
}
