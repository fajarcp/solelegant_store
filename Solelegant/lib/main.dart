import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solelegant/core/injection/injection.dart';
import 'package:solelegant/core/provider/base/multi_providers.dart';
import 'package:solelegant/ui/screens/onboarding/splash_screen.dart';

import 'core/route/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(MultiProvider(
      providers: MultiProviders.providers,
      child: const MyApp()));
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppRouter appRouter;
  @override
  void initState() {
    super.initState();
    appRouter = locator<AppRouter>();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      title: 'Solelegant',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
    );
  }
}


