import 'package:electro_app/consts/consts.dart';
import 'package:electro_app/consts/strings.dart';
import 'package:electro_app/consts/images.dart';

Widget homeButtons({width, height, icon, String? title, onPress}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(icon, width: 26),
      10.heightBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make()
  
    ],
  ).box.rounded.white.size(width, height).make();
}