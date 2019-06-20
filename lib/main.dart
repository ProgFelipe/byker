import 'package:bayker/home/HomeView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';

void main() => runApp(EasyLocalization(child: MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;

    return EasyLocalizationProvider(
        data: data,
        child: MaterialApp(
            title: 'bayker',
            localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          //app-specific localization
          EasylocaLizationDelegate(
              locale: data.locale ?? Locale('en'), path: 'locale'),
        ],
        supportedLocales: [Locale('en'), Locale('es')],
        locale: data.locale,
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.orange,
            ),
            //home: MyHomePage(title: 'Flutter Demo Home Page'),
            home: HomeView()));
  }
}
