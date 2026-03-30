import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:teste_imobi_brasil/src/core/fp/either.dart';
import 'package:teste_imobi_brasil/src/core/providers/application_providers.dart';
import 'package:teste_imobi_brasil/src/features/home/home_state.dart';

part 'home_viewmodel.g.dart';

@riverpod
class HomeVm extends _$HomeVm {
  @override
  Future<HomeState> build() async {
    final imoveis = await ref.read(getImoveisProvider.future);
    
    switch (imoveis) {
      case Success(value: final imoveis):
        return HomeState(status: HomeStateStatus.loaded, imoveis: imoveis);
      case Failure():
        return HomeState(status: HomeStateStatus.error, imoveis: []);
    }
  }
}
