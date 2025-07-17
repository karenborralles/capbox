import 'package:capbox/features/boxer/presentation/pages/boxer_ficha_tecnica_page.dart';
import 'package:capbox/features/boxer/presentation/pages/boxer_history_page.dart';
import 'package:capbox/features/boxer/presentation/pages/boxer_metrics_page.dart';
import 'package:capbox/features/boxer/presentation/pages/boxer_profile_page.dart';
import 'package:capbox/features/boxer/presentation/pages/boxer_summary_page.dart';
import 'package:capbox/features/boxer/presentation/pages/boxer_technique_page.dart';
import 'package:capbox/features/boxer/presentation/pages/boxer_timer_page.dart';
import 'package:capbox/features/boxer/presentation/pages/boxer_timer_summary_page.dart';
import 'package:capbox/features/coach/presentation/pages/coach_assign_goals_page.dart';
import 'package:capbox/features/coach/presentation/pages/coach_assign_routine_page.dart';
import 'package:capbox/features/coach/presentation/pages/coach_create_routine_page.dart';
import 'package:capbox/features/coach/presentation/pages/coach_home_page.dart';
import 'package:capbox/features/coach/presentation/pages/coach_manage_routine_page.dart';
import 'package:capbox/features/coach/presentation/pages/coach_manage_routines_page.dart';
import 'package:capbox/features/coach/presentation/pages/coach_routines_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:capbox/features/auth/presentation/pages/login_page.dart';
import 'package:capbox/features/auth/presentation/pages/register_page.dart';
import 'package:capbox/features/boxer/presentation/pages/boxer_home_page.dart';
import 'package:capbox/features/boxer/presentation/pages/boxer_events_page.dart';
import 'package:capbox/features/boxer/presentation/pages/boxer_invitation_detail_page.dart';
import 'package:capbox/features/coach/presentation/pages/coach_profile_page.dart';
import 'package:capbox/features/coach/presentation/pages/coach_history_page.dart';
import 'package:capbox/features/coach/presentation/pages/coach_attendance_page.dart';

final GoRouter appRouter = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(path: '/', builder: (_, __) => const LoginPage()),
    GoRoute(path: '/register', builder: (_, __) => const RegisterPage()),
    GoRoute(path: '/boxer-home', builder: (_, __) => const BoxerHomePage()),
    GoRoute(path: '/boxer-events', builder: (_, __) => const BoxerEventsPage()),
    GoRoute(path: '/boxer-events-detail', builder: (_, __) => const BoxerEventsPage()),
    GoRoute(path: '/invitation-detail', builder: (_, __) => const BoxerInvitationDetailPage()),
    GoRoute(path: '/perfil', builder: (_, __) => const BoxerProfilePage()),
    GoRoute(path: '/historial', builder: (_, __) => const BoxerHistoryPage()),
    GoRoute(path: '/ficha-tecnica', builder: (_, __) => const BoxerFichaTecnicaPage()),
    GoRoute(path: '/metrics', builder: (_, __) => const BoxerMetricsPage()),
    GoRoute(path: '/timer', builder: (_, __) => const BoxerTimerPage()),
    GoRoute(path: '/timer-summary', builder: (_, __) => const BoxerTimerSummaryPage()),
    GoRoute(path: '/technique', pageBuilder: (context, state) => const MaterialPage(child: BoxerTechniquePage())),
    GoRoute(path: '/summary', builder: (context, state) => const BoxerSummaryPage()),

    //entrenador
    GoRoute(
      path: '/coach-home',
      builder: (context, state) => const CoachHomePage(),
    ),
    GoRoute(
      path: '/coach-profile',
      builder: (context, state) => const CoachProfilePage(),
    ),
    GoRoute(
      path: '/coach-history',
      builder: (context, state) => const CoachHistoryPage(),
    ),
    GoRoute(
      path: '/coach-attendance',
      builder: (_, __) => const CoachAttendancePage(),
    ),
    GoRoute(
      path: '/coach-routines',
      builder: (context, state) => const CoachRoutinesPage(),
    ),
    GoRoute(
      path: '/assign-routine/:nivel',
      builder: (context, state) {
        final nivel = state.pathParameters['nivel']!;
        return CoachAssignRoutinePage(nivel: nivel);
      },
    ),
    GoRoute(
      path: '/coach/manage-routines',
      builder: (context, state) => const CoachManageRoutinesPage(),
    ),
    GoRoute(
      path: '/coach/manage/:nivel',
      builder: (context, state) {
        final nivel = state.pathParameters['nivel']!;
        return CoachManageRoutinePage(nivel: nivel);
      },
    ),
    GoRoute(
      path: '/coach/create-routine',
      builder: (context, state) => const CoachCreateRoutinePage(),
    ),
    GoRoute(
      path: '/coach/assign-goals',
      builder: (context, state) => const CoachAssignGoalsPage(),
    ),
  ],
);