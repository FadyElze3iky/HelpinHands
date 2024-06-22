import 'package:flutter/material.dart';
import 'package:helping_hands/Features/Home/presentation/widgets/app_bar_title.dart';
import 'package:helping_hands/Features/Home/presentation/widgets/to_locations_list.dart';

class Bar extends StatelessWidget {
  const Bar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      forceMaterialTransparency: true,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      floating: true,
      actions: [
        // IconButton(
        //     onPressed: () {
        //       Navigator.push(context, MaterialPageRoute(builder: (context) {
        //         return DangerMap();
        //       }));
        //     },
        //     icon: Image.asset(
        //       'assets/icons/map-marker (1).png',
        //       height: 25,
        //       color: Theme.of(context).colorScheme.onBackground,
        //     )),
        to_locations_list(),
      ],
      flexibleSpace: const FlexibleSpaceBar(
        background: AppBarTitle(),
      ),
    );
  }
}
