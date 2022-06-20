import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
class LoginController extends GetxController{
  var _googleSignin = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);
  login () async{
    googleAccount.value = await _googleSignin.signIn();
  }

    logout () async{
    googleAccount.value = await _googleSignin.signOut();
  }
}