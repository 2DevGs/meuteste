import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teste_imobi_brasil/src/core/ui/themes/colors_constants.dart';
import 'package:teste_imobi_brasil/src/core/ui/widgets/loader.dart';
import 'package:teste_imobi_brasil/src/features/home/home_state.dart';
import 'package:teste_imobi_brasil/src/features/home/home_viewmodel.dart';
import 'package:teste_imobi_brasil/src/features/home/widget/home_imoveis_box.dart';
import 'package:teste_imobi_brasil/src/features/home/widget/home_appbar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeVmProvider);

    return Scaffold(
      backgroundColor: ColorsConstants.fundo,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).pushNamed('/imovel/register');
          ref.invalidate(homeVmProvider);
        },
        shape: const CircleBorder(),
        elevation: 0,
        backgroundColor: ColorsConstants.primaria,
        child: const CircleAvatar(
          backgroundColor: ColorsConstants.fundo,
          maxRadius: 12,
          child: Icon(
            Icons.add,
            color: ColorsConstants.primaria,
          ),
        ),
      ),
      extendBody: true,
      body: homeState.when(
        data: (HomeState data) {
          return CustomScrollView(
            slivers: [
              const ImoveisAppbar(),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 32,
                    bottom: 24,
                  ),
                  child: Text(
                    'Imóveis disponíveis',
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: data.imoveis.length,
                  (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ImoveisBox(imovel: data.imoveis[index]),
                  ),
                ),
              ),
            ],
          );
        },
        error: (error, stackTrace) => const Center(),
        loading: () => const Loader(),
      ),

      // bottomNavigationBar: const HomeBottomNavBar(),
    );
  }
}
