import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teste_imobi_brasil/src/core/ui/helpers/messages.dart';
import 'package:teste_imobi_brasil/src/core/ui/themes/colors_constants.dart';
import 'package:teste_imobi_brasil/src/model/imovel_model.dart';

class ImovelDetailPage extends ConsumerStatefulWidget {
  const ImovelDetailPage({super.key});

  @override
  ConsumerState<ImovelDetailPage> createState() => _ImovelDetailPageState();
}

class _ImovelDetailPageState extends ConsumerState<ImovelDetailPage>
    with Messages {
  @override
  Widget build(BuildContext context) {
    final imovel = ModalRoute.of(context)!.settings.arguments as ImovelModel;
    return Scaffold(
      backgroundColor: ColorsConstants.fundo,
      appBar: AppBar(
        title: const Text('Detalhes do imóvel'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                color: ColorsConstants.fundo,
                height: 270,
                width: MediaQuery.sizeOf(context).width,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: CachedNetworkImage(
                    imageUrl: imovel.foto,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      height: 160,
                      color: ColorsConstants.fundo,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          imovel.titulo,
                          style: const TextStyle(
                              fontSize: 20,
                              color: ColorsConstants.textoPrincipal),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * .9,
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              imovel.descricao,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: ColorsConstants.textoSecundario),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Bairro: ',
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorsConstants.textoPrincipal),
                        ),
                        Text(
                          imovel.bairro,
                          style: const TextStyle(
                              fontSize: 16,
                              color: ColorsConstants.textoSecundario),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Tipo: ',
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorsConstants.textoPrincipal),
                        ),
                        Text(
                          imovel.tipo,
                          style: const TextStyle(
                              fontSize: 16,
                              color: ColorsConstants.textoSecundario),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Cidade: ',
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorsConstants.textoPrincipal),
                        ),
                        Text(
                          imovel.cidade,
                          style: const TextStyle(
                              fontSize: 16,
                              color: ColorsConstants.textoSecundario),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Nº Quartos: ',
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorsConstants.textoPrincipal),
                        ),
                        Text(
                          imovel.quartos.toString(),
                          style: const TextStyle(
                              fontSize: 16,
                              color: ColorsConstants.textoSecundario),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Nº Banheiros: ',
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorsConstants.textoPrincipal),
                        ),
                        Text(
                          imovel.banheiros.toString(),
                          style: const TextStyle(
                              fontSize: 16,
                              color: ColorsConstants.textoSecundario),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Nº Vagas: ',
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorsConstants.textoPrincipal),
                        ),
                        Text(
                          imovel.vagas.toString(),
                          style: const TextStyle(
                              fontSize: 16,
                              color: ColorsConstants.textoSecundario),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Area m²: ',
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorsConstants.textoPrincipal),
                        ),
                        Text(
                          imovel.area.toString(),
                          style: const TextStyle(
                              fontSize: 16,
                              color: ColorsConstants.textoSecundario),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Preço: ',
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorsConstants.textoPrincipal),
                        ),
                        Text(
                          imovel.preco.toString(),
                          style: const TextStyle(
                              fontSize: 16,
                              color: ColorsConstants.textoSecundario),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            maximumSize: const Size.fromHeight(56),
                          ),
                          onPressed: () {
                            showInfoSnackBar('Entre em contato com o número +55 (18) 99999-9999');
                          },
                          child: const Text('Cadastrar imóvel'),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
