import 'package:flutter/material.dart';
import 'package:virtual_visiting_card/db/sqlite_helper.dart';
import 'package:virtual_visiting_card/model/contact_model.dart';

class ContactDetailsPage extends StatefulWidget {
  static const String routeName = '/contact_list_details';

  @override
  _ContactDetailsPageState createState() => _ContactDetailsPageState();
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {
  ContactModel? _contactModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void didChangeDependencies() {
    int id = ModalRoute.of(context)!.settings.arguments as int;
    DBHelper.getContactById(id).then((contact) {
      setState(() {
        _contactModel = contact;
      });
    }).catchError((error){


    });
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_contactModel!.name),
      ),
      body: _contactModel == null ? Center(
        child: CircularProgressIndicator(),
      ): ListView(
        children: [],
      ) ,
    );
  }
}
