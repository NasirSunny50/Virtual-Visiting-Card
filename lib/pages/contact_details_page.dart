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
        backgroundColor: Colors.teal,
      ),
      body: _contactModel == null ? Center(
        child: CircularProgressIndicator(),
      ): ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        children: [
          ListTile(
            title: Text(_contactModel!.designation!),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(_contactModel!.companyName!),
                ],
            ),
          ),
          SizedBox(height: 20,),
          Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Text(_contactModel!.mobile!),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.message_rounded),
                          onPressed: (){

                          },
                        ),

                        IconButton(
                          icon: Icon(Icons.call),
                          onPressed: (){

                          },
                        ),
                      ],
                    ),
                  ),

                  ListTile(
                    title: Text(_contactModel!.streetAddress!),
                    trailing: IconButton(
                      icon: Icon(Icons.map_rounded),
                      onPressed: (){

                      },
                    ),
                  ),

                  ListTile(
                    title: Text(_contactModel!.email!),
                    trailing: IconButton(
                      icon: Icon(Icons.email_rounded),
                      onPressed: (){

                      },
                    ),
                  ),

                  ListTile(
                    title: Text(_contactModel!.website!),
                    trailing: IconButton(
                      icon: Icon(Icons.web_rounded),
                      onPressed: (){

                      },
                    ),
                  ),


                ],
              ),
            ),
          )
        ],
      ) ,
    );
  }
}
