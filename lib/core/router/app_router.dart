import 'package:capbox/features/boxer/presentation/pages/boxer_home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:capbox/features/auth/presentation/pages/login_page.dart';
import 'package:capbox/features/auth/presentation/pages/register_page.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: '/boxer-home',
      builder: (context, state) => const BoxerHomePage(),
    ),
  ],
);