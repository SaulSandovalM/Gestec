import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gestec/core/constants/colors.dart';
import 'package:gestec/core/widgets/footer.dart';
import 'package:gestec/core/widgets/site_logo.dart';
import 'package:gestec/screens/authwrapper/view/authwrapper.dart';
import 'package:gestec/screens/dashboard/view/dashboard.dart';
import 'package:gestec/screens/signin/view/signin.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    final user = FirebaseAuth.instance.currentUser;
    final isAuthPage = state.uri.toString() == '/signin';
    if (user == null && !isAuthPage) {
      return '/signin';
    }
    if (user != null && isAuthPage) {
      return '/dashboard';
    }
    return null;
  },
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        final user = FirebaseAuth.instance.currentUser;
        return Scaffold(
          backgroundColor: CustomColor.navBarBg,
          appBar: AppBar(
            backgroundColor: CustomColor.navBarBg,
            elevation: 0,
            leading: user != null
                ? Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  )
                : null,
            title: SizedBox(
              height: 60,
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SiteLogo(
                    onTap: () {
                      context.go('/');
                    },
                  ),
                  Row(
                    children: [
                      if (user != null)
                        IconButton(
                          icon: const Icon(Icons.notifications),
                          onPressed: () {
                            showMenu(
                              context: context,
                              position:
                                  const RelativeRect.fromLTRB(100, 60, 0, 0),
                              items: [
                                PopupMenuItem(
                                  child: ListTile(
                                    leading: const Icon(
                                        Icons.notification_important),
                                    title: const Text('Notificación 1'),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                                PopupMenuItem(
                                  child: ListTile(
                                    leading: const Icon(
                                        Icons.notification_important),
                                    title: const Text('Notificación 2'),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                                PopupMenuItem(
                                  child: ListTile(
                                    leading: const Icon(
                                        Icons.notification_important),
                                    title: const Text('Notificación 3'),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      if (user != null)
                        PopupMenuButton<String>(
                          icon: const Icon(Icons.person),
                          offset: const Offset(0, 50),
                          onSelected: (String result) async {
                            final ctx = context;
                            if (result == 'signin') {
                              ctx.go('/signin');
                            } else if (result == 'signout') {
                              await FirebaseAuth.instance.signOut();
                              if (!ctx.mounted) return;
                              ctx.go('/signin');
                            }
                          },
                          itemBuilder: (BuildContext context) {
                            return <PopupMenuEntry<String>>[
                              const PopupMenuItem<String>(
                                value: 'signout',
                                child: Text('Cerrar sesión'),
                              ),
                            ];
                          },
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          drawer: user != null
              ? Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      const DrawerHeader(
                        child: Text('Menu'),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.dashboard,
                          color: GoRouter.of(context)
                                      .routerDelegate
                                      .currentConfiguration
                                      .fullPath ==
                                  '/dashboard'
                              ? Colors.white
                              : Colors.black,
                        ),
                        title: Text(
                          'Panel de control',
                          style: TextStyle(
                            color: GoRouter.of(context)
                                        .routerDelegate
                                        .currentConfiguration
                                        .fullPath ==
                                    '/dashboard'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        selected: GoRouter.of(context)
                                .routerDelegate
                                .currentConfiguration
                                .fullPath ==
                            '/dashboard',
                        selectedTileColor: CustomColor.primaryColor,
                        onTap: () {
                          context.go('/dashboard');
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.update,
                          color: GoRouter.of(context)
                                      .routerDelegate
                                      .currentConfiguration
                                      .fullPath ==
                                  '/sales'
                              ? Colors.white
                              : Colors.black,
                        ),
                        title: Text(
                          'Seguimiento',
                          style: TextStyle(
                            color: GoRouter.of(context)
                                        .routerDelegate
                                        .currentConfiguration
                                        .fullPath ==
                                    '/sales'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        selected: GoRouter.of(context)
                                .routerDelegate
                                .currentConfiguration
                                .fullPath ==
                            '/sales',
                        selectedTileColor: CustomColor.primaryColor,
                        onTap: () {
                          context.go('/sales');
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.group,
                          color: GoRouter.of(context)
                                      .routerDelegate
                                      .currentConfiguration
                                      .fullPath ==
                                  '/services'
                              ? Colors.white
                              : Colors.black,
                        ),
                        title: Text(
                          'Usuarios',
                          style: TextStyle(
                            color: GoRouter.of(context)
                                        .routerDelegate
                                        .currentConfiguration
                                        .fullPath ==
                                    '/servcies'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        selected: GoRouter.of(context)
                                .routerDelegate
                                .currentConfiguration
                                .fullPath ==
                            '/services',
                        selectedTileColor: CustomColor.primaryColor,
                        onTap: () {
                          context.go('/services');
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.gpp_good),
                        title: Text(
                          'Permisos',
                          style: TextStyle(
                            color: GoRouter.of(context)
                                        .routerDelegate
                                        .currentConfiguration
                                        .fullPath ==
                                    '/customers'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        selected: GoRouter.of(context)
                                .routerDelegate
                                .currentConfiguration
                                .fullPath ==
                            '/customers',
                        selectedTileColor: CustomColor.primaryColor,
                        onTap: () {
                          context.go('/customers');
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.settings),
                        title: Text(
                          'Administración',
                          style: TextStyle(
                            color: GoRouter.of(context)
                                        .routerDelegate
                                        .currentConfiguration
                                        .fullPath ==
                                    '/inventario'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        selected: GoRouter.of(context)
                                .routerDelegate
                                .currentConfiguration
                                .fullPath ==
                            '/inventario',
                        selectedTileColor: CustomColor.primaryColor,
                        onTap: () {
                          context.go('/inventario');
                        },
                      ),
                    ],
                  ),
                )
              : null,
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      child,
                      const Footer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const AuthWrapper(),
        ),
        GoRoute(
          path: '/signin',
          builder: (context, state) => const SignIn(),
        ),
        GoRoute(
          path: '/dashboard',
          builder: (context, state) => const Dashboard(),
          redirect: (context, state) => _requireAuth(),
        ),
      ],
    ),
  ],
  errorPageBuilder: (context, state) => MaterialPage(
    child: Scaffold(
      body: Center(
        child: Text('Page not found: ${state.uri}'),
      ),
    ),
  ),
);

String? _requireAuth() {
  final user = FirebaseAuth.instance.currentUser;
  return user == null ? '/signin' : null;
}
