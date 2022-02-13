import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      confirmDismiss: _showConfirmationDialog,
      onDismissed: (direction){
        // ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(
        //         content: Text('Deleted'),
        //     duration: const Duration(seconds: 5),
        //     action: SnackBarAction(
        //       label: 'Undo',
        //     onPressed: (){
        //
        //     },),));
        DBHelper.deleteContact(widget.contactModel.id!);
        // Future.delayed(const Duration(seconds: 5), (){
        //
        // });
      },
      background: Container(
        padding: const EdgeInsets.only(right: 15),
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: Icon(Icons.delete_rounded, color: Colors.white,),
      ),
      child: Card(
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
      ),
    );
  }

  Future <bool?> _showConfirmationDialog(DismissDirection direction){
    return showDialog(context: context, builder: (context) => AlertDialog(
      title: Text('Delete ${widget.contactModel.name}?'),
      content: const Text('Are you sure to delete this contact?'),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context, false);
        },
            child: const Text('Cancel')),

        ElevatedButton(
            onPressed: (){
              Navigator.pop(context, true);
        },
            child: const Text('Yes'))
      ],
    ));
  }
}
