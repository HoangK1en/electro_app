import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electro_app/consts/consts.dart';
import 'package:electro_app/consts/images.dart';
import 'package:electro_app/consts/strings.dart';
import 'package:electro_app/controllers/auth_controller.dart';
import 'package:electro_app/controllers/profile_controller.dart';
import 'package:electro_app/services/firestore_services.dart';
import 'package:electro_app/views/auth_screen/login_screen.dart';
import 'package:electro_app/views/profile_screen/components/detail_card.dart';
import 'package:electro_app/views/profile_screen/edit_profile_screen.dart';
import 'package:electro_app/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return bgWidget(
      child: Scaffold(
        body: StreamBuilder
        (stream: FirestoreServices.getUser(currentUser! .uid),
         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              ),
            );
          }
          else {
              var data = snapshot.data!.docs[0];

            return SafeArea(child: Column(
          children: [
           //edit profile button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Align(alignment: Alignment.topRight,child: Icon(Icons.edit, color: whiteColor)).onTap(() {
                controller.nameController.text = data['name'];
            
                      Get.to(() =>  EditProfileScreen(
                        data: data,
                      ));
              }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                      data['imageUrl'] =='' ?

                  Image.asset(imgProfile2, width: 100,fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make() :
                  
                  Image.network(data['imageUrl'], width: 80,fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make(),
                  10.widthBox,
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "${data['name']}".text.fontFamily(semibold).white.make(),
                      "${data['email']}".text.white.make(),
                    ],
                  )),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: whiteColor,
                      )
                    ),
                    onPressed: () async {
                      await Get.put(AuthController()).signoutMethod(context);
                        Get.delete<AuthController>();
                      Get.offAll(() => const LoginScreen());
                    },
                    child: logout.text.fontFamily(semibold).white.make(),
                  )
                ],
              ),
            ),
         5.heightBox,
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            detailsCard(count: data['cart_count'], title: "in your cart", width: context.screenWidth / 3.4),
             detailsCard(count: data['wishlist_count'], title: "in your wishlist", width: context.screenWidth / 3.4),
              detailsCard(count: data['order_count'], title: "in your orders", width: context.screenWidth / 3.4),
          ],
         ),
        
          //button section
            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                  return const Divider(color: lightGrey);
              },
              itemCount: profileButtonList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Image.asset(
                    profileButtonIcon[index],
                    width: 22,
                  ),
                  title: profileButtonList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                );
              },
            ).box.white.rounded.margin(EdgeInsets.all(12)).padding(const EdgeInsets.symmetric(horizontal: 16)).shadowSm.make().box.color(redColor).make(),
        
          ],
        ));
          }
         } )
      )
    );
  }
}

