import 'package:five_wheel/gen/strings.g.dart';
import 'package:five_wheel/router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // i18n
  LocaleSettings.useDeviceLocale();
  // Supabase
  await Supabase.initialize(
    url: 'https://geqomjbjuurwiqgylymp.supabase.co',
    anonKey: const String.fromEnvironment('SUPABASE_KEY'),
    authOptions: const FlutterAuthClientOptions(
      authFlowType: AuthFlowType.pkce,
    ),
    realtimeClientOptions: const RealtimeClientOptions(
      logLevel: kReleaseMode ? RealtimeLogLevel.error : RealtimeLogLevel.info,
    ),
    storageOptions: const StorageClientOptions(
      retryAttempts: 10,
    ),
    debug: true,
  );
  // App
  runApp(TranslationProvider(child: const ProviderScope(child: MyApp())));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      theme: ThemeData(useMaterial3: true, fontFamily: 'NotoSans'),
      routerConfig: ref.read(routerProvider),
    );
  }
}
