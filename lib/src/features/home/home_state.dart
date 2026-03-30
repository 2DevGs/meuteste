import 'package:teste_imobi_brasil/src/model/imovel_model.dart';

enum HomeStateStatus {loaded, error}

class HomeState {
  final HomeStateStatus status;
  final List<ImovelModel> imoveis;

  HomeState({required this.status, required this.imoveis});


  HomeState copyWith({
    HomeStateStatus? status,
    List<ImovelModel>? imoveis,
  }) {
    return HomeState(
      status: status ?? this.status,
      imoveis: imoveis ?? this.imoveis,
    );
  }
}
