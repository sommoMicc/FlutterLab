import 'package:flutter/material.dart';
import 'package:login_signup/UI/style.dart';
import "package:login_signup/model/pojo/user.dart";
import 'package:login_signup/model/pojo/connection_status.dart';

class AppState with ChangeNotifier  {
  User _user;
  BuildContext context;
  ConnectionStatus _connectionStatus;

  CustomAppDimensions _size;

  AppState() : _size = CustomAppDimensions(
    orientation: Orientation.landscape
  );

  get user => this._user;
  set user(User newUser) {
    this._user = newUser;
    notifyListeners();
  }

  get size => this._size;
  void setOrientationAndSize(Orientation o, double height, double width) {
    if(_size.sizes != null && _size.sizes[0] != 100 && o == _size.orientation)
      return;

    _size = CustomAppDimensions(orientation: o,sizes: [height,width]);
  }

  get connectionStatus => this._connectionStatus ?? ConnectionStatus.disconnected;
  set connectionStatus (ConnectionStatus newStatus){
    this._connectionStatus = newStatus;
    notifyListeners();
  }

}