import 'package:flutter/material.dart';
import 'package:rcadmin_user/data/dummy_profile.dart';
import 'package:rcadmin_user/pages/contributions.dart';
import 'package:rcadmin_user/pages/frequencies.dart';
import 'package:rcadmin_user/pages/historic.dart';
import 'package:rcadmin_user/pages/profile_form.dart';
import 'package:rcadmin_user/utils/app_routes.dart';

import 'components/drawer_menu_profile.dart';
import 'components/menu_profile.dart';
import 'components/profile_components/expansion_data_profile.dart';

import 'components/profile_components/profile_head_card.dart';
import 'components/profile_components/profile_image.dart';
import 'model/user_profile.dart';

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

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('RCADMIN'),
            actions: const [
              MenuProfile(),
            ],
            backgroundColor: Colors.blueGrey,
          ),
          drawer: DrawerMenuProfile(
            user: user,
          ),
          body: Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
            alignment: Alignment.center,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProfileImage(
                    imageUrl: user[0]!.image,
                    imageHeight: 170,
                    imageWidth: 170,
                    marginHeight: 190,
                    marginWidth: 190,
                  ),
                  ProfileHeadCard(
                    user: user,
                  ),
                  ExpansionDataProfile(profiles: profiles),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PROFILE_FORM);
            },
            child: const Icon(Icons.edit),
            backgroundColor: Colors.blueGrey,
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.grey[400],
            child: Container(
              height: 60,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ),
      routes: {
        AppRoutes.PROFILE_FORM: (ctx) => const ProfileForm(),
        AppRoutes.FREQUENCIES: (ctx) => const Frequencies(),
        AppRoutes.HISTORIC: (ctx) => const Historics(),
        AppRoutes.CONTRIBUTIONS: (ctx) => const Contributions(),
      },
    );
  }
}
