// Copyright (C) 2026 5V Network LLC <5vnetwork@proton.me>
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

part of 'main.dart';

// Router globals
GlobalKey<NavigatorState> rootNavigationKey = GlobalKey<NavigatorState>();
final ValueNotifier<RoutingConfig> myRoutingConfig =
    ValueNotifier<RoutingConfig>(const RoutingConfig(routes: <RouteBase>[]));
late final GoRouter _router;

// Desktop browser-like back/forward history (separate from navigator stack).
final List<String> _historyStack = [];
final List<String> _forwardStack = [];
bool _isBackForwardNav = false;

void _recordLocation(String location) {
  if (location.isEmpty || location == '/') return;
  if (_historyStack.isNotEmpty && _historyStack.last == location) return;
  _historyStack.add(location);
  _forwardStack.clear();
}

/// Desktop-only: navigate back (mouse back / browser back key).
void desktopNavigateBack() {
  if (_historyStack.length < 2) return;
  final current = _historyStack.removeLast();
  _forwardStack.add(current);
  final location = _historyStack.last;
  _isBackForwardNav = true;
  _router.go(location);
}

/// Desktop-only: navigate forward (mouse forward / browser forward key).
void desktopNavigateForward() {
  if (_forwardStack.isEmpty) return;
  final location = _forwardStack.removeLast();
  _historyStack.add(location);
  _isBackForwardNav = true;
  _router.go(location);
}

/// Initialize the router after preferences are loaded
void initRouter(SharedPreferences pref) {
  _router =
      GoRouter.routingConfig(
          debugLogDiagnostics: true,
          initialLocation: pref.initialLocation,
          navigatorKey: rootNavigationKey,
          routingConfig: myRoutingConfig,
        )
        ..routerDelegate.addListener(() {
          try {
            final location = _router.routeInformationProvider.value.uri
                .toString();
            if (location.isNotEmpty && location != '/') {
              logger.d('set initial location: $location');
              pref.setInitialLocation(location);
              if (_isBackForwardNav) {
                // Location change triggered by our own back/forward — don't record.
                _isBackForwardNav = false;
              } else {
                _recordLocation(location);
              }
            }
          } catch (e) {
            // Ignore errors during initialization
          }
        });
}

// final nodeNavigatorKey1 = GlobalKey<NavigatorState>();
// final logNavigatorKey1 = GlobalKey<NavigatorState>();
// final routeNavigatorKey1 = GlobalKey<NavigatorState>();
// final serverNavigatorKey1 = GlobalKey<NavigatorState>();
// final settingNavigatorKey1 = GlobalKey<NavigatorState>();
GoRoute settingRoute() {
  return GoRoute(
    path: '/setting',
    parentNavigatorKey: rootNavigationKey,
    pageBuilder: (context, state) =>
        const CupertinoPage(child: CompactSettingScreen(showAppBar: true)),
    routes: [
      GoRoute(
        parentNavigatorKey: rootNavigationKey,
        path: 'account',
        pageBuilder: (context, state) =>
            const CupertinoPage(child: AccountPage()),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigationKey,
        path: 'general',
        pageBuilder: (context, state) =>
            const CupertinoPage(child: GeneralSettingPage()),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigationKey,
        path: 'privacy',
        pageBuilder: (context, state) =>
            const CupertinoPage(child: PrivacyPolicyScreen()),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigationKey,
        path: 'contactUs',
        pageBuilder: (context, state) =>
            const CupertinoPage(child: ContactScreen()),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigationKey,
        path: 'openSourceSoftwareNotice',
        pageBuilder: (context, state) =>
            const CupertinoPage(child: OpenSourceSoftwareNoticeScreen()),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigationKey,
        path: 'advanced',
        pageBuilder: (context, state) =>
            const CupertinoPage(child: AdvancedScreen()),
        routes: [
          GoRoute(
            path: 'system-proxy',
            pageBuilder: (context, state) =>
                const CupertinoPage(child: ProxyShareSettingScreen()),
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: rootNavigationKey,
        path: 'ads',
        pageBuilder: (context, state) =>
            const CupertinoPage(child: PromotionPage()),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigationKey,
        path: 'debugLog',
        pageBuilder: (context, state) =>
            const CupertinoPage(child: DebugLogPage()),
      ),
    ],
  );
}

final compactRouteConfig = RoutingConfig(
  redirect: (context, state) {
    if (state.matchedLocation == '/') {
      return '/home';
    }
    return null;
  },
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          ShellPage(state: state, child: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  key: state.pageKey,
                  child: const HomePage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) => child,
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          // navigatorKey: nodeNavigatorKey1,
          routes: [
            GoRoute(
              path: '/node',
              pageBuilder: (context, state) {
                final extra =
                    state.extra is NodePageExtra
                    ? state.extra as NodePageExtra
                    : null;
                return CustomTransitionPage(
                  key: state.pageKey,
                  child: OutboundPage(extra: extra),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) => child,
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          // navigatorKey: logNavigatorKey1,
          routes: [
            GoRoute(
              path: '/log',
              pageBuilder: (context, state) => CustomTransitionPage(
                key: state.pageKey,
                child: const LogPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) => child,
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          // navigatorKey: routeNavigatorKey1,
          routes: [
            GoRoute(
              path: '/route',
              pageBuilder: (context, state) => CustomTransitionPage(
                key: state.pageKey,
                child: const RoutePage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) => child,
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          // navigatorKey: serverNavigatorKey1,
          routes: [
            GoRoute(
              path: '/server',
              pageBuilder: (context, state) => CustomTransitionPage(
                key: state.pageKey,
                child: const ServerScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) => child,
              ),
            ),
          ],
        ),
      ],
    ),
    settingRoute(),
  ],
);

// final nodeNavigatorKey = GlobalKey<NavigatorState>();
// final logNavigatorKey = GlobalKey<NavigatorState>();
// final routeNavigatorKey = GlobalKey<NavigatorState>();
// final serverNavigatorKey = GlobalKey<NavigatorState>();
// final settingNavigatorKey = GlobalKey<NavigatorState>();
// final shellNavigationKey = GlobalKey<NavigatorState>();
RoutingConfig largeScreenRouteConfig(SharedPreferences pref) {
  return RoutingConfig(
    redirect: (context, state) {
      if (state.matchedLocation == '/') {
        return pref.initialLocation;
      }
      return null;
    },
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            ShellPage(state: state, child: navigationShell),
        branches: [
          StatefulShellBranch(
            // navigatorKey: nodeNavigatorKey,
            routes: [
              GoRoute(
                path: '/home',
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    child: const HomePage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            child,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            // navigatorKey: nodeNavigatorKey,
            routes: [
              GoRoute(
                path: '/node',
                pageBuilder: (context, state) {
                  final extra =
                      state.extra is NodePageExtra
                      ? state.extra as NodePageExtra
                      : null;
                  return CustomTransitionPage(
                    key: state.pageKey,
                    child: OutboundPage(extra: extra),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            child,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            // navigatorKey: logNavigatorKey,
            routes: [
              GoRoute(
                path: '/log',
                pageBuilder: (context, state) => CustomTransitionPage(
                  key: state.pageKey,
                  child: const LogPage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) => child,
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            // navigatorKey: routeNavigatorKey,
            routes: [
              GoRoute(
                path: '/route',
                pageBuilder: (context, state) => CustomTransitionPage(
                  key: state.pageKey,
                  child: const RoutePage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) => child,
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            // navigatorKey: serverNavigatorKey,
            routes: [
              GoRoute(
                path: '/server',
                pageBuilder: (context, state) => CustomTransitionPage(
                  key: state.pageKey,
                  child: const ServerScreen(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) => child,
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            // navigatorKey: settingNavigatorKey,
            routes: [
              GoRoute(
                path: '/setting',
                redirect: (context, state) {
                  return '/setting/account';
                },
              ),
              GoRoute(
                path: '/setting/:settingItem',
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    child: LargeSettingSreen(
                      settingItem: SettingItem.fromPathSegment(
                        state.pathParameters['settingItem']!,
                      )!,
                    ),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                          return child;
                        },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
