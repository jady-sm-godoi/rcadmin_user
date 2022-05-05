import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rcadmin_user/model/user_profile_list.dart';

import '../components/drawer_menu_profile.dart';
import '../components/menu_profile.dart';

import '../components/profile_components/expansion_data_profile.dart';
import '../components/profile_components/profile_head_card.dart';
import '../components/profile_components/profile_image.dart';

import '../utils/app_routes.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserProfileList users = Provider.of(context);

    return Scaffold(
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
                imageUrl: users.profiles[0].image,
                imageHeight: 170,
                imageWidth: 170,
                marginHeight: 190,
                marginWidth: 190,
              ),
              const ProfileHeadCard(),
              const ExpansionDataProfile(),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
