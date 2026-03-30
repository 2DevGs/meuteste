import 'package:asyncstate/asyncstate.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:teste_imobi_brasil/src/core/fp/either.dart';
import 'package:teste_imobi_brasil/src/core/providers/application_providers.dart';
import 'package:teste_imobi_brasil/src/features/auth/register/user/user_register_provider.dart';

part 'user_register_viewmodel.g.dart';

enum UserRegisterStateStatus { initial, success, error }

@riverpod
class UserRegisterViewmodel extends _$UserRegisterViewmodel {
  @override
  UserRegisterStateStatus build() => UserRegisterStateStatus.initial;

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final userRegisterService = ref.watch(userRegisterServiceProvider);

    final userDTO = (
      name: name,
      email: email,
      password: password,
    );

    final registerResult =
        await userRegisterService.execute(userDTO).asyncLoader();
    switch (registerResult) {
      case Success():
        ref.invalidate(getMeProvider);
        state = UserRegisterStateStatus.success;
      case Failure():
        state = UserRegisterStateStatus.error;
    }
  }
}
