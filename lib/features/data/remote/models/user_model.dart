class UserModel{
  final String gmail;
  final String password;
  final String name;
  final String phoneNo;

  UserModel(this.gmail, this.password, this.name, this.phoneNo);

  Map<String,dynamic> toJson(){
    return{
      'gmail': gmail,
      'password' : password,
      'name' : name,
      'phoneNo' : phoneNo,
    };
  }
}



