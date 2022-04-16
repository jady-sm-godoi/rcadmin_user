import 'package:flutter/material.dart';
import 'package:rcadmin_user/model/user_profile.dart';

class ExpansionDataProfile extends StatefulWidget {
  final List<UserProfile> profiles;

  ExpansionDataProfile({
    Key? key,
    required this.profiles,
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
          children: widget.profiles
              .map(
                (profile) => ExpansionPanel(
                  canTapOnHeader: true,
                  isExpanded: _contactExpanded,
                  headerBuilder: (context, _contactExpanded) => ListTile(
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
          children: widget.profiles
              .map(
                (profile) => ExpansionPanel(
                  canTapOnHeader: true,
                  isExpanded: _addressExpanded,
                  headerBuilder: (context, _addressExpanded) => ListTile(
                    title: Text('Endereço:'),
                  ),
                  body: ListTile(
                    subtitle: Text(profile.address),
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
          children: widget.profiles
              .map(
                (profile) => ExpansionPanel(
                  canTapOnHeader: true,
                  isExpanded: _moreExpanded,
                  headerBuilder: (context, _moreExpanded) => ListTile(
                    title: Text('Mais:'),
                  ),
                  body: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('profissão: ${profile.profession}'),
                        Text('nasc.: ${profile.birthday}'),
                        Text('estado civil: ${profile.maritalStatus}'),
                        Divider(),
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
