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

  @override
  String toString() {
    return 'ContactModel{id: $id, name: $name, designation: $designation, email: $email, mobile: $mobile, streetAddress: $streetAddress, companyName: $companyName, website: $website, favourite: $favourite}';
  }
}