import 'package:asyncstate/asyncstate.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:teste_imobi_brasil/src/core/fp/either.dart';
import 'package:teste_imobi_brasil/src/core/providers/application_providers.dart';
import 'package:teste_imobi_brasil/src/features/auth/login/login_state.dart';

part 'login_viewmodel.g.dart';

@riverpod
class LoginViewmodel extends _$LoginViewmodel {
  @override
  LoginState build() => LoginState.initial();

  Future<void> login(String email, String password) async {
    final loaderHandle = AsyncLoaderHandler()..start();
    final loginService = ref.watch(userLoginServiceProvider);
    final result = await loginService.execute(email, password);

    switch (result) {
      case Success():
        ref.invalidate(getMeProvider);
        final userModel = await ref.read(getMeProvider.future);
        if(userModel.id != null) {
        state = state.copyWith(status: LoginStateStatus.success);
        }
        break;
      case Failure():
        state = state.copyWith(
          status: LoginStateStatus.error,
        );
    }
    loaderHandle.close();
  }
}
