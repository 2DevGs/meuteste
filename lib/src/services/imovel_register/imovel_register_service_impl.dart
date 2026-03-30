import 'package:teste_imobi_brasil/src/core/exceptions/service_exception.dart';
import 'package:teste_imobi_brasil/src/core/fp/either.dart';
import 'package:teste_imobi_brasil/src/core/fp/nil.dart';
import 'package:teste_imobi_brasil/src/repositories/imovel/imovel_repository.dart';

import 'imovel_register_service.dart';

class ImovelRegisterServiceImpl implements ImovelRegisterService {
  final ImovelRepository imovelRepository;

  ImovelRegisterServiceImpl({required this.imovelRepository});

  @override
  Future<Either<ServiceException, Nil>> execute(
      ({
        String titulo,
        String descricao,
        String tipo,
        double preco,
        String cidade,
        String bairro,
        int quartos,
        int banheiros,
        int vagas,
        double area,
        String foto,
      }) imovelData) async {
    final imovelResult = await imovelRepository.registerImovel(imovelData);

    switch (imovelResult) {
      case Success():
        return Success(nil);
      case Failure():
        return Failure(ServiceException(message: 'Erro ao registrar imóvel'));
    }
  }
}
