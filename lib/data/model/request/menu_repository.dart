import '../response/menu_model.dart';

class MenuItems{

  static const List<MenuItem> itemlist = [
    changepassword,
    logout,
  ];

  static const changepassword = MenuItem(text: 'Change Password',);
  static const logout = MenuItem(text: 'Log Out',);

}