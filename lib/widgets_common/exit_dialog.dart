
import 'package:electro_app/consts/consts.dart';
import 'package:electro_app/widgets_common/our_button.dart';

Widget exitDialog() {
  return Dialog(
    child: Column(
      children: [
        "Confirm".text.fontFamily(bold).size(18).color(darkFontGrey).make(),
        const Divider(),
        10.heightBox,
        "Are you sure you want to exit?"
        .text
        .size(16)
        .color(darkFontGrey)
        .make(),
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ourButton(
              color: redColor,
              onPress: () {},
              textColor: whiteColor,
              title: "Yes"),
              ourButton(
              color: redColor,
              onPress: () {},
              textColor: whiteColor,
              title: "No"),
          ],
        ),
      ],
    ).box.color(lightGrey).roundedSM.make(),
  );
}