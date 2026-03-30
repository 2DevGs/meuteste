import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/material.dart';
import 'package:teste_imobi_brasil/src/core/ui/imobi_nav_global_key.dart';
import 'package:teste_imobi_brasil/src/features/auth/login/login_page.dart';
import 'package:teste_imobi_brasil/src/core/ui/themes/imobi_theme.dart';
import 'package:teste_imobi_brasil/src/core/ui/widgets/loader.dart';
import 'package:teste_imobi_brasil/src/features/imovel/register/imovel_register_page.dart';
import 'package:teste_imobi_brasil/src/features/auth/register/user/user_register_page.dart';
import 'package:teste_imobi_brasil/src/features/home/home_page.dart';
import 'package:teste_imobi_brasil/src/features/imovel/detail/imovel_detail_page.dart';
import 'package:teste_imobi_brasil/src/features/imovel/update/imovel_update_page.dart';
import 'package:teste_imobi_brasil/src/features/splash/splash_screen.dart';

class ImobiMainApp extends StatelessWidget {
  const ImobiMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncStateBuilder(
      customLoader: const Loader(),
      builder: (asyncNavigatorObserver) {
        return MaterialApp(
          theme: ImobiTheme.themeData,
          navigatorObservers: [asyncNavigatorObserver],
          navigatorKey: ImobiNavGlobalKey.instance.navKey,
          title: 'ImobiBrasil',
          routes: {
            '/': (_) => const SplashScreen(),
            '/auth/login': (_) => const LoginPage(),
            '/auth/register/user': (_) => const UserRegisterPage(),
            '/home': (_) => const HomePage(),
            '/imovel/register': (_) => const ImovelRegisterPage(),
            '/imovel/update': (_) => const ImovelUpdatePage(),
            '/imovel/detail': (_) => const ImovelDetailPage(),
          },
        );
      },
    );
  }
}
