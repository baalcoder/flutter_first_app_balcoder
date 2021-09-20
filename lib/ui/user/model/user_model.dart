class UserModel {
  String? key;
  String userName;
  String userEmail;
  bool isDeleted;

  UserModel(
      {this.key,
      required this.userName,
      required this.userEmail,
      required this.isDeleted});

  factory UserModel.fromSnapshot({data, id}) {
    return UserModel(
        key: id,
        userEmail: data['userEmail'],
        userName: data['userName'],
        isDeleted: data['isDeleted'] != null ? data['isDeleted'] : false);
  }
}
