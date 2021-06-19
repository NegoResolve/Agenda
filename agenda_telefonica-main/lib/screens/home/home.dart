import 'package:agenda_de_contatos/models/contact.dart';
import 'package:agenda_de_contatos/screens/details/details.dart';
import 'package:agenda_de_contatos/style.dart';
import 'package:flutter/material.dart';
import 'package:agenda_de_contatos/provider/contacts.dart';

class Home extends StatefulWidget {
  @override
  createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Meus Contatos")),
        floatingActionButton:
            FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
        body: ListView.separated(
            itemBuilder: builder,
            separatorBuilder: (BuildContext context, int _) {
              return Divider(color: grayDivider, thickness: 1);
            },
            itemCount: listOfContacts.length));
  }

  Widget builder(BuildContext context, int index) {
    Contact contact = listOfContacts.elementAt(index);
    return ListTile(
      leading: IconButton(
        //? = se for true (verdadeiro)
        //: = se for false (falso)
        icon: Hero(
          tag: contact.phone,
          child: Icon((contact.isFavorite) ? Icons.star : Icons.star_border,
              color: Theme.of(context).primaryColor, size: 20),
        ),
        onPressed: () {
          //Flutter, reconstrua a tela
          setState(() {
            contact.isFavorite = !contact.isFavorite;
          });
        },
      ),
      title: Row(
        children: [
          ClipOval(
            child: Hero(
              tag: contact.name,
              child: Image.asset(
                contact.photo,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(contact.name,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: grayTheme)),
              Text(contact.phone,
                  style: TextStyle(fontSize: 10, color: grayTheme)),
            ],
          )
        ],
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.chevron_right,
          size: 15,
        ),
        //pop para remover tela e push para adicionar uma nova
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return Details(contact);
              },
            ),
          );
        },
      ),
    );
  }
}

// ListView(
//Direção do scroll
//         scrollDirection: Axis.vertical,
//         children: [Text("Texto 1"), Text("Texto 2"), Text("Texto 3")],
//       ),
