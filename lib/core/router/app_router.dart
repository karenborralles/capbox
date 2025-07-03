import 'package:capbox/features/boxer/presentation/pages/boxer_ficha_tecnica_page.dart';
import 'package:capbox/features/boxer/presentation/pages/boxer_metrics_page.dart';
import 'package:go_router/go_router.dart';
import 'package:capbox/features/auth/presentation/pages/login_page.dart';
import 'package:capbox/features/auth/presentation/pages/register_page.dart';
import 'package:capbox/features/boxer/presentation/pages/boxer_home_page.dart';
import 'package:capbox/features/boxer/presentation/pages/boxer_events_page.dart';
import 'package:capbox/features/boxer/presentation/pages/boxer_invitation_detail_page.dart';
import 'package:capbox/features/boxer/presentation/pages/boxer_profile_page.dart';
import 'package:capbox/features/boxer/presentation/pages/boxer_history_page.dart';

final GoRouter appRouter = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const LoginPage(),
    ),
    GoRoute(
      path: '/register',
      builder: (_, __) => const RegisterPage(),
    ),
    GoRoute(
      path: '/boxer-home',
      builder: (_, __) => const BoxerHomePage(),
    ),
    GoRoute(
      path: '/boxer-events',
      builder: (_, __) => const BoxerEventsPage(),
    ),
    GoRoute(
      path: '/boxer-events-detail',
      builder: (_, __) => const BoxerEventsPage(),
    ),
    GoRoute(
      path: '/invitation-detail',
      builder: (_, __) => const BoxerInvitationDetailPage(),
    ),
    GoRoute(
      path: '/perfil',
      builder: (_, __) => const BoxerProfilePage(),
    ),
    GoRoute(
      path: '/historial',
      builder: (_, __) => const BoxerHistoryPage(),
    ),
    GoRoute(
      path: '/ficha-tecnica',
      builder: (_, __) => const BoxerFichaTecnicaPage(),
    ),
    GoRoute(
      path: '/metrics',
      builder: (_, __) => const BoxerMetricsPage(),
    ),
  ],
);
