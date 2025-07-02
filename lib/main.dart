import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';

import 'package:capbox/core/router/app_router.dart';
import 'package:capbox/features/auth/application/auth_injector.dart';

void main() => runApp(const CapBoxApp());

class CapBoxApp extends StatelessWidget {
  const CapBoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Dio>(create: (_) => Dio()),
        ...authProviders,          // tus providers de Auth
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'CapBox',
        routerConfig: appRouter,   // GoRouter
        theme: ThemeData.dark(),   // opcional
      ),
    );
  }
}