import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teste_imobi_brasil/src/core/ui/helpers/messages.dart';
import 'package:teste_imobi_brasil/src/features/auth/login/login_page.dart';
import 'package:teste_imobi_brasil/src/core/ui/themes/colors_constants.dart';
import 'package:teste_imobi_brasil/src/core/ui/themes/resource.dart';
import 'package:teste_imobi_brasil/src/features/splash/splash_viewmodel.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> with Messages {
  var _scale = 10.0;
  var _animationOpacityLogo = 0.0;

  double get _logoAnimationWidth => 50 * _scale;
  double get _logoAnimationHeight => 50 * _scale;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _animationOpacityLogo = 1.0;
        _scale = 5;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      splashViewmodelProvider,
      (_, state) {
        state.whenOrNull(
          error: (error, stackTrace) {
            log('Erro ao realizar login', error: error, stackTrace: stackTrace);
            showErrorSnackBar('Erro ao validar o login');
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/auth/login',
              (route) => false,
            );
          },
          data: (data) {
            switch (data) {
              case SplashState.logged:
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/home', (route) => false);
              case _:
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/auth/login', (route) => false);
            }
          },
        );
      },
    );
    return Scaffold(
      backgroundColor: ColorsConstants.primaria,
      body: Container(
        color: Colors.black.withAlpha(600),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 1500),
              curve: Curves.easeIn,
              opacity: _animationOpacityLogo,
              onEnd: () {
                Navigator.of(context).pushAndRemoveUntil(
                  PageRouteBuilder(
                    settings: const RouteSettings(name: '/auth/login'),
                    pageBuilder: (
                      context,
                      animation,
                      secondaryAnimation,
                    ) {
                      return const LoginPage();
                    },
                    transitionsBuilder: (
                      _,
                      animation,
                      __,
                      child,
                    ) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                  (route) => false,
                );
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 3),
                curve: Curves.linearToEaseOut,
                width: _logoAnimationWidth,
                height: _logoAnimationHeight,
                child: Image.asset(
                  R.ASSETS_IMAGES_ICONE_ORIGINAL_IMOBIBRASIL_PNG,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
