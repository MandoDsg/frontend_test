import 'package:flutter/material.dart';
import 'package:frontend/views/movilidad_integrada/cablebus/cb_linea_2.dart';
import 'package:go_router/go_router.dart';
import 'package:frontend/views/wrapper/main_wrapper.dart';
import 'package:frontend/views/home/home_view.dart';
import 'package:frontend/views/info/info_view.dart';
import 'package:frontend/views/movilidad_integrada/mi_view.dart';
import 'package:frontend/views/movilidad_integrada/metro/metro_view.dart';
import 'package:frontend/views/movilidad_integrada/metro/linea_1.dart';
import 'package:frontend/views/movilidad_integrada/metro/linea_2.dart';
import 'package:frontend/views/movilidad_integrada/metro/linea_3.dart';
import 'package:frontend/views/movilidad_integrada/metro/linea_4.dart';
import 'package:frontend/views/movilidad_integrada/metro/linea_5.dart';
import 'package:frontend/views/movilidad_integrada/metro/linea_6.dart';
import 'package:frontend/views/movilidad_integrada/metro/linea_7.dart';
import 'package:frontend/views/movilidad_integrada/metro/linea_8.dart';
import 'package:frontend/views/movilidad_integrada/metro/linea_9.dart';
import 'package:frontend/views/movilidad_integrada/metro/linea_a.dart';
import 'package:frontend/views/movilidad_integrada/metro/linea_b.dart';
import 'package:frontend/views/movilidad_integrada/metro/linea_12.dart';
import 'package:frontend/views/movilidad_integrada/metrobus/metrobus_view.dart';
import 'package:frontend/views/movilidad_integrada/metrobus/mb_linea_1.dart';
import 'package:frontend/views/movilidad_integrada/metrobus/mb_linea_2.dart';
import 'package:frontend/views/movilidad_integrada/metrobus/mb_linea_3.dart';
import 'package:frontend/views/movilidad_integrada/metrobus/mb_linea_4.dart';
import 'package:frontend/views/movilidad_integrada/metrobus/mb_linea_5.dart';
import 'package:frontend/views/movilidad_integrada/metrobus/mb_linea_6.dart';
import 'package:frontend/views/movilidad_integrada/metrobus/mb_linea_7.dart';
import 'package:frontend/views/movilidad_integrada/trenligero/trenligero_view.dart';
import 'package:frontend/views/movilidad_integrada/cablebus/cablebus_view.dart';
import 'package:frontend/views/movilidad_integrada/cablebus/cb_linea_1.dart';
import 'package:frontend/views/settings/settings_view.dart';

class AppNavigation {
  AppNavigation._();

  static String initial = "/home";

  // Private navigators
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _shellNavigatorMI =
      GlobalKey<NavigatorState>(debugLabel: 'shellMI');
  static final _shellNavigatorSettings =
      GlobalKey<NavigatorState>(debugLabel: 'shellSettings');

  // GoRouter configuration
  static final GoRouter router = GoRouter(
    initialLocation: initial,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      /// MainWrapper
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainWrapper(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          /// Brach Home
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHome,
            routes: <RouteBase>[
              GoRoute(
                path: "/home",
                name: "Home",
                builder: (BuildContext context, GoRouterState state) =>
                    const HomeView(),
              ),
            ],
          ),

          /// Brach MI
          StatefulShellBranch(
            navigatorKey: _shellNavigatorMI,
            routes: <RouteBase>[
              GoRoute(
                path: "/MI",
                name: "MI",
                builder: (BuildContext context, GoRouterState state) =>
                    const MIView(),
                routes: [
                  //? ----------------------------------------------------------
                  //? ----------------------------------------------------------
                  //? ------------------------| METRO |-------------------------
                  //? ----------------------------------------------------------
                  //? ----------------------------------------------------------
                  GoRoute(
                      path: "subMetro",
                      name: "subMetro",
                      pageBuilder: (context, state) {
                        return CustomTransitionPage<void>(
                          key: state.pageKey,
                          child: const SubMetro(),
                          transitionsBuilder: (
                            context,
                            animation,
                            secondaryAnimation,
                            child,
                          ) =>
                              FadeTransition(opacity: animation, child: child),
                        );
                      },
                      routes: [
                        GoRoute(
                          path: "subMetroL1",
                          name: "subMetroL1",
                          pageBuilder: (context, state) {
                            return CustomTransitionPage<void>(
                              key: state.pageKey,
                              child: const SubMetroL1(),
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) =>
                                  FadeTransition(
                                      opacity: animation, child: child),
                            );
                          },
                        ),
                        GoRoute(
                          path: "subMetroL2",
                          name: "subMetroL2",
                          pageBuilder: (context, state) {
                            return CustomTransitionPage<void>(
                              key: state.pageKey,
                              child: const SubMetroL2(),
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) =>
                                  FadeTransition(
                                      opacity: animation, child: child),
                            );
                          },
                        ),
                        GoRoute(
                          path: "subMetroL3",
                          name: "subMetroL3",
                          pageBuilder: (context, state) {
                            return CustomTransitionPage<void>(
                              key: state.pageKey,
                              child: const SubMetroL3(),
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) =>
                                  FadeTransition(
                                      opacity: animation, child: child),
                            );
                          },
                        ),
                        GoRoute(
                          path: "subMetroL4",
                          name: "subMetroL4",
                          pageBuilder: (context, state) {
                            return CustomTransitionPage<void>(
                              key: state.pageKey,
                              child: const SubMetroL4(),
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) =>
                                  FadeTransition(
                                      opacity: animation, child: child),
                            );
                          },
                        ),
                        GoRoute(
                          path: "subMetroL5",
                          name: "subMetroL5",
                          pageBuilder: (context, state) {
                            return CustomTransitionPage<void>(
                              key: state.pageKey,
                              child: const SubMetroL5(),
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) =>
                                  FadeTransition(
                                      opacity: animation, child: child),
                            );
                          },
                        ),
                        GoRoute(
                          path: "subMetroL6",
                          name: "subMetroL6",
                          pageBuilder: (context, state) {
                            return CustomTransitionPage<void>(
                              key: state.pageKey,
                              child: const SubMetroL6(),
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) =>
                                  FadeTransition(
                                      opacity: animation, child: child),
                            );
                          },
                        ),
                        GoRoute(
                          path: "subMetroL7",
                          name: "subMetroL7",
                          pageBuilder: (context, state) {
                            return CustomTransitionPage<void>(
                              key: state.pageKey,
                              child: const SubMetroL7(),
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) =>
                                  FadeTransition(
                                      opacity: animation, child: child),
                            );
                          },
                        ),
                        GoRoute(
                          path: "subMetroL8",
                          name: "subMetroL8",
                          pageBuilder: (context, state) {
                            return CustomTransitionPage<void>(
                              key: state.pageKey,
                              child: const SubMetroL8(),
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) =>
                                  FadeTransition(
                                      opacity: animation, child: child),
                            );
                          },
                        ),
                        GoRoute(
                          path: "subMetroL9",
                          name: "subMetroL9",
                          pageBuilder: (context, state) {
                            return CustomTransitionPage<void>(
                              key: state.pageKey,
                              child: const SubMetroL9(),
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) =>
                                  FadeTransition(
                                      opacity: animation, child: child),
                            );
                          },
                        ),
                        GoRoute(
                          path: "subMetroLA",
                          name: "subMetroLA",
                          pageBuilder: (context, state) {
                            return CustomTransitionPage<void>(
                              key: state.pageKey,
                              child: const SubMetroLA(),
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) =>
                                  FadeTransition(
                                      opacity: animation, child: child),
                            );
                          },
                        ),
                        GoRoute(
                          path: "subMetroLB",
                          name: "subMetroLB",
                          pageBuilder: (context, state) {
                            return CustomTransitionPage<void>(
                              key: state.pageKey,
                              child: const SubMetroLB(),
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) =>
                                  FadeTransition(
                                      opacity: animation, child: child),
                            );
                          },
                        ),
                        GoRoute(
                          path: "subMetroL12",
                          name: "subMetroL12",
                          pageBuilder: (context, state) {
                            return CustomTransitionPage<void>(
                              key: state.pageKey,
                              child: const SubMetroL12(),
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) =>
                                  FadeTransition(
                                      opacity: animation, child: child),
                            );
                          },
                        ),
                      ]),
                  //? ----------------------------------------------------------
                  //? ----------------------------------------------------------
                  //? -----------------------| METROBUS |-----------------------
                  //? ----------------------------------------------------------
                  //? ----------------------------------------------------------
                  GoRoute(
                      path: "subMetrobus",
                      name: "subMetrobus",
                      pageBuilder: (context, state) {
                        return CustomTransitionPage<void>(
                          key: state.pageKey,
                          child: const SubMetrobus(),
                          transitionsBuilder: (
                            context,
                            animation,
                            secondaryAnimation,
                            child,
                          ) =>
                              FadeTransition(opacity: animation, child: child),
                        );
                      },
                      routes: [
                        GoRoute(
                          path: "subMetrobusL1",
                          name: "subMetrobusL1",
                          pageBuilder: (context, state) {
                            return CustomTransitionPage<void>(
                              key: state.pageKey,
                              child: const SubMetrobusL1(),
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) =>
                                  FadeTransition(
                                      opacity: animation, child: child),
                            );
                          },
                        ),
                        GoRoute(
                          path: "subMetrobusL2",
                          name: "subMetrobusL2",
                          pageBuilder: (context, state) {
                            return CustomTransitionPage<void>(
                              key: state.pageKey,
                              child: const SubMetrobusL2(),
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) =>
                                  FadeTransition(
                                      opacity: animation, child: child),
                            );
                          },
                        ),
                        GoRoute(
                          path: "subMetrobusL3",
                          name: "subMetrobusL3",
                          pageBuilder: (context, state) {
                            return CustomTransitionPage<void>(
                              key: state.pageKey,
                              child: const SubMetrobusL3(),
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) =>
                                  FadeTransition(
                                      opacity: animation, child: child),
                            );
                          },
                        ),
                        GoRoute(
                          path: "subMetrobusL4",
                          name: "subMetrobusL4",
                          pageBuilder: (context, state) {
                            return CustomTransitionPage<void>(
                              key: state.pageKey,
                              child: const SubMetrobusL4(),
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) =>
                                  FadeTransition(
                                      opacity: animation, child: child),
                            );
                          },
                        ),
                        GoRoute(
                          path: "subMetrobusL5",
                          name: "subMetrobusL5",
                          pageBuilder: (context, state) {
                            return CustomTransitionPage<void>(
                              key: state.pageKey,
                              child: const SubMetrobusL5(),
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) =>
                                  FadeTransition(
                                      opacity: animation, child: child),
                            );
                          },
                        ),
                        GoRoute(
                          path: "subMetrobusL6",
                          name: "subMetrobusL6",
                          pageBuilder: (context, state) {
                            return CustomTransitionPage<void>(
                              key: state.pageKey,
                              child: const SubMetrobusL6(),
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) =>
                                  FadeTransition(
                                      opacity: animation, child: child),
                            );
                          },
                        ),
                        GoRoute(
                          path: "subMetrobusL7",
                          name: "subMetrobusL7",
                          pageBuilder: (context, state) {
                            return CustomTransitionPage<void>(
                              key: state.pageKey,
                              child: const SubMetrobusL7(),
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) =>
                                  FadeTransition(
                                      opacity: animation, child: child),
                            );
                          },
                        ),
                      ]),
                  //? ----------------------------------------------------------
                  //? ----------------------------------------------------------
                  //? ---------------------| TREN LIGERO |----------------------
                  //? ----------------------------------------------------------
                  //? ----------------------------------------------------------
                  GoRoute(
                    path: "subTrenLigero",
                    name: "subTrenLigero",
                    pageBuilder: (context, state) {
                      return CustomTransitionPage<void>(
                        key: state.pageKey,
                        child: const SubTrenLigero(),
                        transitionsBuilder: (
                          context,
                          animation,
                          secondaryAnimation,
                          child,
                        ) =>
                            FadeTransition(opacity: animation, child: child),
                      );
                    },
                  ),
                  //? ----------------------------------------------------------
                  //? ----------------------------------------------------------
                  //? ----------------------| CABLEBUS |------------------------
                  //? ----------------------------------------------------------
                  //? ----------------------------------------------------------
                  GoRoute(
                      path: "subCablebus",
                      name: "subCablebus",
                      pageBuilder: (context, state) {
                        return CustomTransitionPage<void>(
                          key: state.pageKey,
                          child: const SubCablebus(),
                          transitionsBuilder: (
                            context,
                            animation,
                            secondaryAnimation,
                            child,
                          ) =>
                              FadeTransition(opacity: animation, child: child),
                        );
                      },
                      routes: [
                        GoRoute(
                          path: "subCablebusL1",
                          name: "subCablebusL1",
                          pageBuilder: (context, state) {
                            return CustomTransitionPage<void>(
                              key: state.pageKey,
                              child: const SubCablebusL1(),
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) =>
                                  FadeTransition(
                                      opacity: animation, child: child),
                            );
                          },
                        ),
                        GoRoute(
                          path: "subCablebusL2",
                          name: "subCablebusL2",
                          pageBuilder: (context, state) {
                            return CustomTransitionPage<void>(
                              key: state.pageKey,
                              child: const SubCablebusL2(),
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) =>
                                  FadeTransition(
                                      opacity: animation, child: child),
                            );
                          },
                        ),
                      ]),
                ],
              ),
            ],
          ),

          /// Brach Setting
          StatefulShellBranch(
            navigatorKey: _shellNavigatorSettings,
            routes: <RouteBase>[
              GoRoute(
                path: "/settings",
                name: "Settings",
                builder: (BuildContext context, GoRouterState state) =>
                    const SettingsView(),
              ),
            ],
          ),
        ],
      ),

      /// Info
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/info',
        name: "Info",
        builder: (context, state) => InfoView(
          key: state.pageKey,
        ),
      )
    ],
  );
}
