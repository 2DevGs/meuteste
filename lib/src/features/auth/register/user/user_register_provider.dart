import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:teste_imobi_brasil/src/core/providers/application_providers.dart';
import 'package:teste_imobi_brasil/src/services/user_register/user_register_service.dart';
import 'package:teste_imobi_brasil/src/services/user_register/user_register_service_impl.dart';

part 'user_register_provider.g.dart';

@riverpod
UserRegisterService userRegisterService(Ref ref) => UserRegisterServiceImpl(
    userRepository: ref.watch(userRepositoryProvider),
    userLoginService: ref.watch(userLoginServiceProvider));
