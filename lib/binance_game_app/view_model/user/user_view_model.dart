import 'package:binance_game_app_single/binance_game_app/model/user/user_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/base/base_view_model.dart';

class UserViewModel extends BaseViewModel {


  UserModel userModel;

  void user({Function success}){

    this.get({},path: "/user",success: (data){
      userModel = UserModel.fromJson(data);
      if(success != null) {
        success(data);
      }
    });
  }

}