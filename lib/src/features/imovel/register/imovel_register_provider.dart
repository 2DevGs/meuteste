import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:teste_imobi_brasil/src/core/providers/application_providers.dart';
import 'package:teste_imobi_brasil/src/services/imovel_register/imovel_register_service.dart';
import 'package:teste_imobi_brasil/src/services/imovel_register/imovel_register_service_impl.dart';

part 'imovel_register_provider.g.dart';

@riverpod
ImovelRegisterService imovelRegisterService(Ref ref) =>
    ImovelRegisterServiceImpl(
        imovelRepository: ref.watch(imovelRepositoryProvider));
