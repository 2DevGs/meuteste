import 'package:teste_imobi_brasil/src/core/exceptions/repository_exception.dart';
import 'package:teste_imobi_brasil/src/core/fp/either.dart';
import 'package:teste_imobi_brasil/src/model/imovel_model.dart';

abstract interface class ImovelRepository {
  Future<Either<RepositoryException, ImovelModel>> getImovelById(int imovelId);

  Future<Either<RepositoryException, List<ImovelModel>>> getImoveis();

  Future<Either<RepositoryException, ImovelModel>> registerImovel(
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
