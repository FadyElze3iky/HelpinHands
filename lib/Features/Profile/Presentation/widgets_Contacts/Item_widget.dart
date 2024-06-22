import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/Profile/Presentation/manager/emaergancy_contacts/contacts/contacts_cubit.dart';
import 'package:helping_hands/Features/Profile/Presentation/userContact.dart';
import 'package:helping_hands/Features/Profile/data/profileImpl.dart';
import 'package:helping_hands/core/utils/api.dart';

// ignore: must_be_immutable
class ItemWidget extends StatelessWidget {
  ItemWidget({super.key, required this.model});
  Map<String, dynamic> model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () async {
        profileImpl().deleteContactDB(model['uid']);
        BlocProvider.of<ContactsCubit>(context).contacts();
      },
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return UserContact(model: model);
        }));
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60.r),
              boxShadow: [
                BoxShadow(
                    blurRadius: 15.r,
                    offset: Offset(10, 10),
                    color: Color.fromARGB(34, 0, 0, 0))
              ],
            ),
            child: CircleAvatar(
              radius: 60.r,
              backgroundImage: NetworkImage(
                model['PhotoURL'] == ''
                    ? 'https://img.freepik.com/free-psd/3d-illustration-human-avatar-profile_23-2150671116.jpg?t=st=1701551805~exp=1701552405~hmac=0c23b24dde3d757d32bf22ea065e29b73b577b7a952150cd1b89df4e8a7eb8a9'
                    : "${DataBaseApi.serverName}RestApi/${model['PhotoURL'].substring(3)}",
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            model['username'],
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.sp),
          ),
        ],
      ),
    );
  }
}
