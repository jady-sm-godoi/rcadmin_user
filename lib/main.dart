import 'package:flutter/material.dart';
import 'package:rcadmin_user/data/dummy_profile.dart';

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
      home: Scaffold(
        // backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: const Text('RCADMIN'),
          actions: const [
            MenuProfile(),
          ],
          backgroundColor: Colors.blueGrey,
        ),
        drawer: const DrawerMenuProfile(),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
          alignment: Alignment.center,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProfileImage(
                  imageUrl: user[0]!.image,
                ),
                ProfileHeadCard(
                  user: user,
                ),
                ExpansionDataProfile(profiles: profiles),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
