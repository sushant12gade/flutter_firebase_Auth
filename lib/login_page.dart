 

import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/login_controler.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyPage extends StatelessWidget {
  final controller = Get.put(LoginController());

   MyPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Google Sign-In '),
        centerTitle: true,
      ),
      body: Center(
          child:Obx ((){
            if(controller.googleAccount.value==null)
            return  buildLoginButton();
            else
            return buildProfileView();
          }), 

      ),
    );
  }

  Column buildProfileView() {
    return Column(
mainAxisSize: MainAxisSize.min,
children: [
  CircleAvatar(
    backgroundImage: Image.network(controller.googleAccount.value?.photoUrl??'').image,
    radius: 100,

  ),
  Text(controller.googleAccount.value?.displayName??'',
  style: Get.textTheme.headline3,),
  Text(controller.googleAccount.value?.email??'',
  style: Get.textTheme.bodyText1,),
  SizedBox(height: 16,),
  ActionChip(label: Text('Logout'), onPressed:(){
    controller.logout();
  },avatar: Icon(Icons.logout),)
],
);
  }

  FloatingActionButton buildLoginButton() {
    return FloatingActionButton.extended(onPressed:  (){
          controller.login();
  }, label: Text("signin with google "),
        backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        icon: Icon(Icons.security_outlined),);
  }
}