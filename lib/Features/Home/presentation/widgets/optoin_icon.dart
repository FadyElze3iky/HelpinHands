import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/Home/data/home_impl.dart';
import 'package:helping_hands/core/widgets/ShowSnackBar.dart';

class OptionIcon extends StatelessWidget {
  OptionIcon({super.key, required this.id});
  String id;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          final RenderBox button = context.findRenderObject() as RenderBox;
          final RenderBox overlay =
              Overlay.of(context).context.findRenderObject() as RenderBox;
          final RelativeRect position = RelativeRect.fromRect(
            Rect.fromPoints(
              button.localToGlobal(Offset.zero, ancestor: overlay),
              button.localToGlobal(button.size.bottomLeft(Offset.zero),
                  ancestor: overlay),
            ),
            Offset.zero & overlay.size,
          );
          await showMenu(
            color: Theme.of(context).colorScheme.primary,
            context: context,
            position: position,
            items: [
              PopupMenuItem(
                child: Center(
                  child: Text(
                    'Report',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 15.sp),
                  ),
                ),
                value: '1',
                onTap: () async {
                  String message = await HomeImpl().ReportPost(id: id);
                  ShowToast(
                      context: context, massage: message, color: Colors.orange);
                },
              ),
            ],
          );
        },
        icon: Image.asset(
          'assets/icons/list.png',
          height: 25.w,
          color: Theme.of(context).colorScheme.onBackground,
        ));
  }
}
