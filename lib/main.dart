import 'package:flutter/material.dart';
import 'package:rcadmin_user/data/dummy_profile.dart';

import 'components/drawer_menu_profile.dart';
import 'components/menu_profile.dart';

import 'model/user_profile.dart';

void main() {
  runApp(const UserPage());
}

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<UserProfile> profile = dummyProfile;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('RCADMIN'),
          actions: const [
            MenuProfile(),
          ],
          backgroundColor: Colors.blueGrey,
        ),
        drawer: DrawerMenuProfile(),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Row(children: [
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://cdn.pixabay.com/photo/2018/01/15/07/52/woman-3083401_960_720.jpg'),
                ),
              ),
            ),
            Container(
              height: 100,
              // color: Colors.grey,
              padding: EdgeInsets.only(left: 20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Aquarius'),
                      Text('960'),
                    ],
                  ),
                  // Spacer(),
                  Text(
                    'Florinda Spring',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text('florinda_spring@email.com')
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
