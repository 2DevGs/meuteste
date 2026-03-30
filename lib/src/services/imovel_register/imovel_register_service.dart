import 'package:teste_imobi_brasil/src/core/exceptions/service_exception.dart';
import 'package:teste_imobi_brasil/src/core/fp/either.dart';
import 'package:teste_imobi_brasil/src/core/fp/nil.dart';

abstract interface class ImovelRegisterService {
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
      }) imovelData);
}
