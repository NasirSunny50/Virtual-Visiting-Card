import 'package:flutter/material.dart';
import 'package:virtual_visiting_card/db/sqlite_helper.dart';
import 'package:virtual_visiting_card/model/contact_model.dart';

class NewContactPage extends StatefulWidget {
  static const String routeName = '/new_contact';

  @override
  _NewContactPageState createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  final _nameController = TextEditingController();
  final _designationController = TextEditingController();
  final _emailController = TextEditingController();
  final _companyController = TextEditingController();
  final _mobileController = TextEditingController();
  final _addressController = TextEditingController();
  final _websiteController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _designationController.dispose();
    _emailController.dispose();
    _companyController.dispose();
    _mobileController.dispose();
    _addressController.dispose();
    _websiteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Contact'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
              onPressed: _saveContact,
              icon: Icon(Icons.done))
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                prefixIcon: Icon(Icons.account_circle),
              ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'Please Provide a Valid Name';
                }
                if(value.length > 20){
                  return 'Name should be within 20 characters';
                }
                return null;
              },
            ),
            SizedBox(height: 10,),

            TextFormField(
              keyboardType: TextInputType.phone,
              controller: _mobileController,
              decoration: InputDecoration(
                labelText: 'Mobile Number',
                prefixIcon: Icon(Icons.phone),
              ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'Please Provide a Valid Number';
                }
                if(value.length > 11){
                  return 'Invalid Number';
                }
                return null;
              },
            ),
            SizedBox(height: 10,),

            TextFormField(
              controller: _designationController,
              decoration: InputDecoration(
                labelText: 'Designation',
                prefixIcon: Icon(Icons.work),
              ),
              validator: (value){
                return null;
              },
            ),
            SizedBox(height: 10,),

            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Street Address',
                prefixIcon: Icon(Icons.apartment),
              ),
              validator: (value){
                return null;
              },
            ),
            SizedBox(height: 10,),

            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email Address',
                prefixIcon: Icon(Icons.email),
              ),
              validator: (value){
                return null;
              },
            ),
            SizedBox(height: 10,),

            TextFormField(
              controller: _companyController,
              decoration: InputDecoration(
                labelText: 'Company',
                prefixIcon: Icon(Icons.add_business),
              ),
              validator: (value){
                return null;
              },
            ),
            SizedBox(height: 10,),

            TextFormField(
              controller: _websiteController,
              decoration: InputDecoration(
                labelText: 'Website',
                prefixIcon: Icon(Icons.web_rounded),
              ),
              validator: (value){
                return null;
              },
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }

  void _saveContact() {
    if(_formKey.currentState!.validate())
      {
        final contact = ContactModel(
            name: _nameController.text,
            mobile: _mobileController.text,
          designation: _designationController.text,
          email: _emailController.text,
          companyName: _companyController.text,
          streetAddress: _addressController.text,
          website: _websiteController.text,
        );
        print(contact);
        DBHelper.insertContact(contact)
            .then((rowId) => Navigator.pop(context));
      }
  }
}