import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:routemaster/routemaster.dart';
import 'package:sorcery_adventure_sheet/model/adventure_sheet_model.dart';
import 'package:sorcery_adventure_sheet/page/create_page.dart';
import 'package:sorcery_adventure_sheet/page/history_page.dart';
import 'package:sorcery_adventure_sheet/page/init_page.dart';
import 'package:sorcery_adventure_sheet/page/main_page.dart';
import 'package:sorcery_adventure_sheet/page/monster_page.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      theme: ThemeData(
          primarySwatch: Colors.brown,
          scaffoldBackgroundColor: Color.fromARGB(0xFF, 0xFE, 0xFE, 0xF9),
          textTheme: GoogleFonts.sawarabiMinchoTextTheme()),
      routerDelegate: RoutemasterDelegate(
          routesBuilder: (context) => _buildRouteMap(context, ref)),
      routeInformationParser: RoutemasterParser(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja'),
        Locale('en'),
      ],
    );
  }

  RouteMap _buildRouteMap(BuildContext context, WidgetRef ref) {
    return RouteMap(routes: {
      '/': (_) => MaterialPage(child: InitPage(), maintainState: false),
      '/main': (route) {
        if (ref.read(adventureSheetModelProvider).created) {
          return MaterialPage(child: MainPage());
        } else {
          return Redirect('/');
        }
      },
      '/create': (_) => MaterialPage(child: CreatePage()),
      '/monster': (_) => MaterialPage(child: MonsterPage()),
      '/history': (_) => MaterialPage(child: HistoryPage()),
    });
  }
}
