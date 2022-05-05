import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcadmin_user/data/dummy_profile.dart';
import 'package:rcadmin_user/pages/contributions.dart';
import 'package:rcadmin_user/pages/frequencies.dart';
import 'package:rcadmin_user/pages/historic.dart';
import 'package:rcadmin_user/pages/profile_form.dart';
import 'package:rcadmin_user/pages/user_profile_page.dart';
import 'package:rcadmin_user/utils/app_routes.dart';

import 'components/drawer_menu_profile.dart';
import 'components/menu_profile.dart';
import 'components/profile_components/expansion_data_profile.dart';

import 'components/profile_components/profile_head_card.dart';
import 'components/profile_components/profile_image.dart';
import 'model/user_profile.dart';
import 'model/user_profile_list.dart';

void main() {
  runApp(const UserPage());
}

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    final List<UserProfile> profiles = dummyProfile;

    final user = profiles.map((profile) {
      if (profile.email == 'jady.s.m@gmail.com') {
        return profile;
      }
    }).toList();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProfileList(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.USER_PROFILE: (ctx) => const UserProfilePage(),
          AppRoutes.PROFILE_FORM: (ctx) => const ProfileForm(),
          AppRoutes.FREQUENCIES: (ctx) => const Frequencies(),
          AppRoutes.HISTORIC: (ctx) => const Historics(),
          AppRoutes.CONTRIBUTIONS: (ctx) => const Contributions(),
        },
      ),
    );
  }
}
