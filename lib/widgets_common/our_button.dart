import 'package:electro_app/consts/consts.dart';
import 'package:electro_app/consts/strings.dart';

Widget ourButton({onPress, color, textColor, title}) {
  return ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: color,
    padding: const EdgeInsets.all(12),
  ),
    onPressed: onPress,
     child: "$title".text.color(textColor).fontFamily(bold).make(),
     );
}