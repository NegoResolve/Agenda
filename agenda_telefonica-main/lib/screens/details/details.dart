import 'package:agenda_de_contatos/models/contact.dart';
import 'package:agenda_de_contatos/screens/details/widgets/actions_menu.dart';
import 'package:agenda_de_contatos/screens/details/widgets/custom_divider.dart';
import 'package:agenda_de_contatos/style.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final Contact _contact;

  Details(this._contact);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Hero(
                tag: _contact.phone,
                child: Icon(
                    (_contact.isFavorite) ? Icons.star : Icons.star_border)),
          )
        ],
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.edit)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(tag: _contact.name, child: Image.asset(_contact.photo)),
            Padding(
                padding: const EdgeInsets.only(top: 20, left: 16),
                child: Text(_contact.name,
                    style: TextStyle(color: grayTheme, fontSize: 24))),
            CustomDivider(),
            ActionsMenu(),
            CustomDivider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.phone_outlined,
                              color: Theme.of(context).primaryColor, size: 18)),
                      SizedBox(width: 14),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_contact.phone,
                                style:
                                    TextStyle(color: grayTheme, fontSize: 12)),
                            Text("Celular",
                                style:
                                    TextStyle(color: grayTheme, fontSize: 10))
                          ])
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.videocam_outlined,
                              color: Theme.of(context).primaryColor, size: 18)),
                      SizedBox(width: 14),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.email_outlined,
                              color: Theme.of(context).primaryColor, size: 18))
                    ],
                  )
                ],
              ),
            ),
            CustomDivider(16),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 16),
              child: Row(children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.email_outlined,
                        color: Theme.of(context).primaryColor, size: 18)),
                SizedBox(width: 5),
                Text(_contact.email,
                    style: TextStyle(color: grayTheme, fontSize: 10))
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
