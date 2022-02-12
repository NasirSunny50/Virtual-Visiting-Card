import 'package:flutter/material.dart';
import 'package:virtual_visiting_card/db/sqlite_helper.dart';
import 'package:virtual_visiting_card/model/contact_model.dart';
import 'package:virtual_visiting_card/pages/contact_details_page.dart';

class ContactItem extends StatefulWidget {
  final ContactModel contactModel;
  final VoidCallback callback;


  ContactItem(this.contactModel, this.callback);

  @override
  _ContactItemState createState() => _ContactItemState();
}

class _ContactItemState extends State<ContactItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, ContactDetailsPage.routeName, arguments: [widget.contactModel.id, widget.contactModel.name]);
        },
        title: Text(widget.contactModel.name),
        trailing: IconButton(
          icon: Icon(widget.contactModel.favourite ? Icons.favorite : Icons.favorite_border, color: Colors.red,),
          onPressed: () {
            final value = widget.contactModel.favourite? 0 : 1;
            DBHelper.updateContactFavourite(widget.contactModel.id!, value).then((_){
              setState(() {
                widget.contactModel.favourite = !widget.contactModel.favourite;
              });
            });
          },
        ),
      ),
    );
  }
}
