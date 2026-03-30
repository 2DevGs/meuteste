import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:teste_imobi_brasil/src/core/ui/themes/colors_constants.dart';
import 'package:teste_imobi_brasil/src/model/imovel_model.dart';

class ImoveisBox extends StatelessWidget {
  final ImovelModel imovel;
  const ImoveisBox({super.key, required this.imovel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () {
        Navigator.of(context).pushNamed('/imovel/update', arguments: imovel);
      },
      onTap: () {
        Navigator.of(context).pushNamed('/imovel/detail', arguments: imovel);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: 345,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        imageUrl: imovel.foto,
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: 253,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) {
                          return Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: MediaQuery.sizeOf(context).height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey,
                            ),
                            child: const Icon(
                              Icons.error,
                              color: Colors.red,
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        imovel.titulo,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: ColorsConstants.textoPrincipal,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        imovel.descricao,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: ColorsConstants.textoSecundario,
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            'Tipo: ',
                            style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: ColorsConstants.textoPrincipal,
                        ),
                          ),
                          Text(
                            imovel.tipo,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: ColorsConstants.textoSecundario,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
