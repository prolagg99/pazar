import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pazar/localization/demo_localization.dart';
import 'package:pazar/model/cart.dart';
import 'package:pazar/model/catalog.dart';
import 'package:provider/provider.dart';
import 'localization/language_constants.dart';
import 'package:pazar/screen/bottom_navigation.dart';
import 'package:pazar/screen/home.dart';
import 'package:pazar/screen/items_cart.dart';
import 'package:pazar/screen/profile.dart';
import 'package:pazar/screen/restaurant_items.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      Provider(create: (context) => CatalogModel()),
      ChangeNotifierProvider(
        create: (context) => CartModel(),
      ),
    ],
    child: const Pazar(),
  ));
}

class Pazar extends StatefulWidget {
  const Pazar({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    _PazarState? state = context.findAncestorStateOfType<_PazarState>();
    state!.setLocale(newLocale);
  }

  @override
  _PazarState createState() => _PazarState();
}

class _PazarState extends State<Pazar> {
  Locale? _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (_locale == null) {
      return const Center(
        child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Localization Demo",
        theme: ThemeData(primarySwatch: Colors.blue),
        locale: _locale,
        supportedLocales: const [Locale("en", "US"), Locale("fr", "FR")],
        localizationsDelegates: const [
          DemoLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale!.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        // onGenerateRoute: CustomRouter.generatedRoute,
        // initialRoute: homeRoute,
        routes: <String, WidgetBuilder>{
          '/': (context) => const BottomNavigation(),
          Home.tag: (context) => const Home(),
          RestaurantItems.tag: (context) => const RestaurantItems(),
          ItemCart.tag: (context) => const ItemCart(),
          Profile.tag: (context) => const Profile(),
        },
      );
    }
  }
}
