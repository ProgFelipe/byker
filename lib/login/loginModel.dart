import 'loginContract.dart';
import 'package:bayker/repository/AuthService.dart';

class LoginModel implements Model{

  @override
  void login(){
    authService.googleSignIn();
  }

  @override
  void logout(){
    authService.signOut();
  }
}