import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rcadmin_user/services/user_profile_list.dart';

class ExpansionDataProfile extends StatefulWidget {
  // final List<UserProfile> profiles;

  const ExpansionDataProfile({
    Key? key,
  }) : super(key: key);

  @override
  _ExpansionDataProfileState createState() => _ExpansionDataProfileState();
}

class _ExpansionDataProfileState extends State<ExpansionDataProfile> {
  bool _contactExpanded = false;
  bool _addressExpanded = false;
  bool _moreExpanded = false;

  @override
  Widget build(BuildContext context) {
    final UserProfileList users = Provider.of(context);

    return Column(
      children: [
        Container(
          height: 5,
        ),
        ExpansionPanelList(
          expansionCallback: (index, isExpanded) {
            setState(() {
              _contactExpanded = !isExpanded;
            });
          },
          children: users.profiles
              .map(
                (profile) => ExpansionPanel(
                  canTapOnHeader: true,
                  isExpanded: _contactExpanded,
                  headerBuilder: (context, _contactExpanded) => const ListTile(
                    title: Text('Contatos:'),
                  ),
                  body: ListTile(
                    title: Text(profile.email),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(),
                        Text(profile.mobilePhone),
                        Text(profile.phone),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        Container(
          height: 5,
        ),
        ExpansionPanelList(
          expansionCallback: (index, isExpanded) {
            setState(() {
              _addressExpanded = !isExpanded;
            });
          },
          children: users.profiles
              .map(
                (profile) => ExpansionPanel(
                  canTapOnHeader: true,
                  isExpanded: _addressExpanded,
                  headerBuilder: (context, _addressExpanded) => const ListTile(
                    title: Text('Endereço:'),
                  ),
                  body: ListTile(
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('${users.profiles[0].street ?? ''}, '),
                            Text(users.profiles[0].houseNumber ?? ''),
                          ],
                        ),
                        if (users.profiles[0].complement != null)
                          Text(users.profiles[0].complement ?? ''),
                        Text(users.profiles[0].district ?? ''),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '${users.profiles[0].city ?? ''} - ${users.profiles[0].uf ?? ''}'),
                            Text('CEP: ${users.profiles[0].zipCode ?? ''}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        Container(
          height: 5,
        ),
        ExpansionPanelList(
          expansionCallback: (index, isExpanded) {
            setState(() {
              _moreExpanded = !isExpanded;
            });
          },
          children: users.profiles
              .map(
                (profile) => ExpansionPanel(
                  canTapOnHeader: true,
                  isExpanded: _moreExpanded,
                  headerBuilder: (context, _moreExpanded) => const ListTile(
                    title: Text('Mais:'),
                  ),
                  body: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('profissão: ${profile.profession}'),
                        Text('nasc.: ${profile.birthday}'),
                        Text('estado civil: ${profile.maritalStatus}'),
                        const Divider(),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('SOS Contact: ${profile.sosContact}'),
                        Text('SOS phone: ${profile.phone}'),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        )
      ],
    );
  }
}
