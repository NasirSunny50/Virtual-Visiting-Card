const String tblContact ='tbl_contact';
const String tblContactColId = 'id';
const String tblContactColName = 'name';
const String tblContactColCompanyName = 'company';
const String tblContactColDesignation = 'designation';
const String tblContactColEmail = 'email';
const String tblContactColMobile = 'mobile';
const String tblContactColAddress = 'address';
const String tblContactColWebsite = 'website';
const String tblContactColFavourite = 'favourite';

class ContactModel{
  int? id;
  String name;
  String? designation;
  String? email;
  String mobile;
  String? streetAddress;
  String? companyName;
  String? website;
  bool favourite;


  ContactModel({
      this.id,
      required this.name,
      this.designation,
      this.email,
      required this.mobile,
      this.streetAddress,
      this.companyName,
      this.website,
      this.favourite = false});

  factory ContactModel.fromMap(Map<String, dynamic>map) => ContactModel(
      name: map[tblContactColName],
      mobile: map[tblContactColMobile],
      id: map[tblContactColId],
      designation: map[tblContactColDesignation],
      email: map[tblContactColEmail],
      companyName: map[tblContactColCompanyName],
      website: map[tblContactColWebsite],
      streetAddress: map[tblContactColAddress],
      favourite: map[tblContactColFavourite] == 1 ? true : false,
  );

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      tblContactColName: name,
      tblContactColCompanyName: companyName,
      tblContactColDesignation: designation,
      tblContactColAddress: streetAddress,
      tblContactColMobile: mobile,
      tblContactColEmail: email,
      tblContactColWebsite: website,
      tblContactColFavourite: favourite? 1 : 0,
    };

    if(id != null){
      map[tblContactColId]=id;
    }

    return map;
  }

  @override
  String toString() {
    return 'ContactModel{id: $id, name: $name, designation: $designation, email: $email, mobile: $mobile, streetAddress: $streetAddress, companyName: $companyName, website: $website, favourite: $favourite}';
  }
}