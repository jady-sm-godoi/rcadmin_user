import 'package:flutter/material.dart';
import 'package:rcadmin_user/data/dummy_profile.dart';

import 'components/drawer_menu_profile.dart';
import 'components/menu_profile.dart';
import 'components/expansion_data_profile.dart';

import 'components/profile_image.dart';
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
        drawer: DrawerMenuProfile(),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
          alignment: Alignment.center,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProfileImage(
                  imageUrl: user[0]!.image,
                ),
                Card(
                  color: Colors.white,
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Text(
                          user[0]!.socialName,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          user[0]!.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                user[0]!.id,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                user[0]!.disciple,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  margin: EdgeInsets.only(top: 20),
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
