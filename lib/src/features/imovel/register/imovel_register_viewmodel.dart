import 'package:asyncstate/asyncstate.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:teste_imobi_brasil/src/core/fp/either.dart';
import 'package:teste_imobi_brasil/src/core/providers/application_providers.dart';
import 'package:teste_imobi_brasil/src/features/imovel/register/imovel_register_provider.dart';

part 'imovel_register_viewmodel.g.dart';

enum ImovelRegisterStateStatus { initial, success, error }

@riverpod
class ImovelRegisterViewmodel extends _$ImovelRegisterViewmodel {
  @override
  ImovelRegisterStateStatus build() => ImovelRegisterStateStatus.initial;

  Future<void> registrarImovel({
    required String titulo,
    required String descricao,
    required String tipo,
    required double preco,
    required String cidade,
    required String bairro,
    required int quartos,
    required int banheiros,
    required int vagas,
    required double area,
    required String foto,
  }) async {
    final imovelRegisterService = ref.watch(imovelRegisterServiceProvider);

    final imovelDTO = (
      titulo: titulo,
      descricao: descricao,
      tipo: tipo,
      preco: preco,
      cidade: cidade,
      bairro: bairro,
      quartos: quartos,
      banheiros: banheiros,
      vagas: vagas,
      area: area,
      foto: foto,
    );
    final loaderHandle = AsyncLoaderHandler()..start();
    final imovelResult =
        await imovelRegisterService.execute(imovelDTO);

    switch (imovelResult) {
      case Success():
        ref.invalidate(getImoveisProvider);
        ref.invalidate(getImovelProvider);
        state = ImovelRegisterStateStatus.success;
      case Failure():
        state = ImovelRegisterStateStatus.error;
    }
    loaderHandle.close();
  }
}
