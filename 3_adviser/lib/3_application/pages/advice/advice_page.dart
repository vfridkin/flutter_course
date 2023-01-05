import 'package:adviser/3_application/core/services/theme_service.dart';
import 'package:adviser/3_application/pages/advice/widgets/advice_field.dart';
import 'package:adviser/3_application/pages/advice/widgets/custom_button.dart';
import 'package:adviser/3_application/pages/advice/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            children: const [
              Expanded(
                  child: Center(
                child: ErrorMessage(message: 'Something went wrong!'),
                // AdviceField(
                //     advice: 'Example advice - you are awesome!')
                //         CircularProgressIndicator(
                //   color: themeData.colorScheme.secondary,
                // )
                // Text(
                //   'When you\'re ready!',
                //   style: themeData.textTheme.headline1,
                // ),
              )),
              SizedBox(
                height: 200,
                child: Center(child: CustomButton()),
              ),
            ],
          )),
    );
  }
}
