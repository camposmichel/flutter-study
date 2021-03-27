class ContactModel {
  late String id;
  late String name;
  late String phone;
  late String? description;

  ContactModel(
      {required this.id,
      required this.name,
      required this.phone,
      this.description});

  ContactModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['description'] = this.description;
    return data;
  }
}
