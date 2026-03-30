import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:teste_imobi_brasil/src/core/ui/themes/colors_constants.dart';

class Loader extends StatelessWidget {

  const Loader({ super.key });

   @override
   Widget build(BuildContext context) {
       return Center(
           child: LoadingAnimationWidget.threeArchedCircle(
            color: ColorsConstants.secundaria,
            size: 60,
           ),
       );
  }
}