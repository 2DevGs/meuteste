import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teste_imobi_brasil/src/core/ui/themes/colors_constants.dart';
import 'package:teste_imobi_brasil/src/core/ui/themes/resource.dart';

class ImoveisAppbar extends ConsumerStatefulWidget {
  const ImoveisAppbar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ImoveisAppbarState();
}

class _ImoveisAppbarState extends ConsumerState<ImoveisAppbar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      foregroundColor: ColorsConstants.fundo,
      backgroundColor: ColorsConstants.fundo.withAlpha(200),
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      pinned: false,
      expandedHeight: MediaQuery.sizeOf(context).height * 0.12,
      forceMaterialTransparency: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 20),
        background: Container(
          color: ColorsConstants.fundo,
        ),
        title: SizedBox(
          width: MediaQuery.sizeOf(context).width * .9,
          child: Image.asset(R.ASSETS_IMAGES_LOGO_ORIGINAL_IMOBIBRASIL_PNG),
        ),
      ),
    );
  }
}
