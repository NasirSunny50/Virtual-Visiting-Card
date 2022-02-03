import 'package:flutter/material.dart';
import 'package:virtual_visiting_card/model/contact_model.dart';

class ContactItem extends StatefulWidget {
  final ContactModel contactModel;


  ContactItem(this.contactModel);

  @override
  _ContactItemState createState() => _ContactItemState();
}

class _ContactItemState extends State<ContactItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.contactModel.name),
        trailing: IconButton(
          icon: Icon(widget.contactModel.favourite ? Icons.favorite : Icons.favorite_border),
          onPressed: () { },
        ),
      ),
    );
  }
}
