import 'package:flutter/material.dart';
import 'package:kt_course/global/auth/auth_controller_provider.dart';

class Avatar extends StatelessWidget with AuthControllerProvider {
  const Avatar({super.key, this.radius = 30});
  final double radius;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: NetworkImage(
        'https://www.oca.edu.vn/uploads/images/info/con-meo-tieng-trung-la-gi.png',
      ),
    );
  }
}