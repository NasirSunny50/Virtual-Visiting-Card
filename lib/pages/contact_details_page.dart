import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:virtual_visiting_card/db/sqlite_helper.dart';
import 'package:virtual_visiting_card/model/contact_model.dart';

class ContactDetailsPage extends StatefulWidget {
  static const String routeName = '/contact_list_details';

  @override
  _ContactDetailsPageState createState() => _ContactDetailsPageState();
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {
  ContactModel? _contactModel;
  int? _id;
  late String _name;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void didChangeDependencies() {
    final arglist = ModalRoute.of(context)!.settings.arguments as List;
    _id = arglist[0];
    _name = arglist[1];

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_name),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: FutureBuilder<ContactModel>(
          future: DBHelper.getContactById(_id!),
          builder: (context, snapshot){
            if(snapshot.hasData){
              _contactModel = snapshot.data;
              return ListView(
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
                            title: Text(_contactModel!.mobile),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.message_rounded),
                                  onPressed: makeSMS,
                                ),

                                IconButton(
                                  icon: Icon(Icons.call),
                                  onPressed:_makePhoneCall,
                                ),
                              ],
                            ),
                          ),

                          ListTile(
                            title: Text(_contactModel!.streetAddress!),
                            trailing: IconButton(
                              icon: Icon(Icons.map_rounded),
                              onPressed: makeMap,
                            ),
                          ),

                          ListTile(
                            title: Text(_contactModel!.email!),
                            trailing: IconButton(
                              icon: Icon(Icons.email_rounded),
                              onPressed: makeEmail,
                            ),
                          ),

                          ListTile(
                            title: Text(_contactModel!.website!),
                            trailing: IconButton(
                              icon: Icon(Icons.web_rounded),
                              onPressed: makeWebsite,
                            ),
                          ),


                        ],
                      ),
                    ),
                  )
                ],
              );
            }
            if(snapshot.hasError){
              return const Text('Failed to Fetch Data');
            }
            return const CircularProgressIndicator();
          },
        ),
      )
    );
  }

  void _makePhoneCall() async{
    final url = 'tel:${_contactModel!.mobile}';
    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      throw 'Could not open the app';
    }
  }
  
  void makeSMS() async{
    final url = 'sms:${_contactModel!.mobile}';
    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      throw 'Could not open the app';
    }
  }

  void makeEmail() async{
    final url = 'mailto:${_contactModel!.email}';
    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      throw 'Could not open the app';
    }
  }

  void makeWebsite() async{
    final url = 'http:${_contactModel!.website}';
    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      throw 'Could not open the app';
    }
  }

  void makeMap() async{
    final url = 'geo:0,0?q=${_contactModel!.streetAddress}';
    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      throw 'Could not open the app';
    }
  }
}

