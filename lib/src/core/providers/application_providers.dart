import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:teste_imobi_brasil/src/core/exceptions/repository_exception.dart';
import 'package:teste_imobi_brasil/src/core/fp/either.dart';
import 'package:teste_imobi_brasil/src/core/restClient/rest_client.dart';
import 'package:teste_imobi_brasil/src/model/imovel_model.dart';
import 'package:teste_imobi_brasil/src/model/user_model.dart';
import 'package:teste_imobi_brasil/src/repositories/imovel/imovel_repository.dart';
import 'package:teste_imobi_brasil/src/repositories/imovel/imovel_repository_impl.dart';
import 'package:teste_imobi_brasil/src/repositories/user/user_repository.dart';
import 'package:teste_imobi_brasil/src/repositories/user/user_repository_impl.dart';
import 'package:teste_imobi_brasil/src/services/user_login/user_login_service.dart';
import 'package:teste_imobi_brasil/src/services/user_login/user_login_service_impl.dart';

part 'application_providers.g.dart';

@Riverpod(keepAlive: true)
RestClient restClient(Ref ref) => RestClient();

@Riverpod(keepAlive: true)
UserRepository userRepository(Ref ref) =>
    UserRepositoryImpl(restClient: ref.read(restClientProvider));

@Riverpod(keepAlive: true)
UserLoginService userLoginService(Ref ref) =>
    UserLoginServiceImpl(userRepository: ref.read(userRepositoryProvider));

@Riverpod(keepAlive: true)
Future<UserModel> getMe(Ref ref) async {
  final result = await ref.watch(userRepositoryProvider).me();
  return switch (result) {
    Success(value: final userModel) => userModel,
    Failure(:final exception) => throw exception,
  };
}

@Riverpod(keepAlive: true)
ImovelRepository imovelRepository(Ref ref) =>
    ImovelRepositoryImpl(restClient: ref.watch(restClientProvider));

@Riverpod(keepAlive: true)
Future<ImovelModel> getImovel(Ref ref, int imovelId) async {
  final imovelRepository = ref.watch(imovelRepositoryProvider);
  final result = await imovelRepository.getImovelById(imovelId);
  return switch (result) {
    Success(value: final imoveis) => imoveis,
    Failure(:final exception) => throw exception,
  };
}

@Riverpod(keepAlive: true)
Future<Either<RepositoryException, List<ImovelModel>>> getImoveis(
    Ref ref) async {
  final imovelRepository = ref.watch(imovelRepositoryProvider);
  return imovelRepository.getImoveis();
}