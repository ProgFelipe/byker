import 'loginContract.dart';

class LoginPresenter implements Presenter {
  View view;
  Model model;

  @override
  void login() {
    model.login();
  }

  @override
  void logout() {
    model.logout();
  }
}
