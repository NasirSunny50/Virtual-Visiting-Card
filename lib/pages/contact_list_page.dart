import 'package:flutter/material.dart';
import 'package:virtual_visiting_card/pages/new_contact_page.dart';

class ContactListPage extends StatefulWidget {
  static const String routeName = '/contact_list';

  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
        backgroundColor: Colors.teal,
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, NewContactPage.routeName);
        },
        child: Icon(Icons.add),
        tooltip: 'Add New Contact',
        backgroundColor: Colors.teal,
      ),
    );
  }
}
