import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_imobi_brasil/src/core/constants/local_storage_keys.dart';
import 'package:teste_imobi_brasil/src/core/providers/application_providers.dart';
import 'package:teste_imobi_brasil/src/model/user_model.dart';

part 'splash_viewmodel.g.dart';

enum SplashState { initial, login, logged, error }

@riverpod
class SplashViewmodel extends _$SplashViewmodel {
  @override
  Future<SplashState> build() async {
    final sp = await SharedPreferences.getInstance();
    if (sp.containsKey(LocalStorageKeys.internalAccessToken)) {
      ref.invalidate(getMeProvider);
      ref.invalidate(getImoveisProvider);

      //aguardar animação
      await Future.delayed(const Duration(milliseconds: 1500));

      try {
        final userModel = await ref.watch(getMeProvider.future);
        return switch (userModel) {
          UserModel() => SplashState.logged,
        };
      } catch (e) {
        return SplashState.error;
      }
    }
    return SplashState.login;
  }
}
