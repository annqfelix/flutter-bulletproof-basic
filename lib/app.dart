import 'package:flutter/material.dart';

import 'router.dart';

class RootApplication extends StatefulWidget {
  const RootApplication({super.key});

  @override
  State<RootApplication> createState() => _RootApplicationState();
}

class _RootApplicationState extends State<RootApplication> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: rootRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
        ),
        useMaterial3: true,
      ),
    );
  }
}
