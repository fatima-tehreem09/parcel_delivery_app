import 'package:abiola_along_client_app/src/core/local/shared_preferences_provider.dart';
import 'package:abiola_along_client_app/src/navigation/app_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    final pref = await SharedPreferences.getInstance();
    // await pref.clear();
    runApp(
      ProviderScope(
        overrides: [
          preferencesProvider.overrideWithValue(pref),
        ],
        child: const App(),
      ),
    );
  }

  @override
  ConsumerState createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0),
          ),
          child: child!,
        );
      },
      title: "Abiola Along",
      debugShowCheckedModeBanner: false,
      routerConfig: ref.read(routerConfigProvider),
    );
  }
}
