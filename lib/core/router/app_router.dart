import 'package:capbox/features/auth/presentation/pages/login_page.dart';
import 'package:capbox/features/auth/presentation/pages/register_page.dart';
import 'package:capbox/features/boxer/domain/entities/boxer_home_data.dart';
import 'package:capbox/features/boxer/presentation/pages/boxer_events_page.dart';
import 'package:go_router/go_router.dart';

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
    GoRoute(
      path: '/boxer-events-detail',
      builder: (context, state) => const BoxerEventsPage(),
    ),
  ],
);
