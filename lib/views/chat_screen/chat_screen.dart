import 'package:electro_app/consts/consts.dart';
import 'package:electro_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Title".text.fontFamily(semibold).color(darkFontGrey).make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: Container(color: Colors.teal,
            child: ListView(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                          //  topLeft: Radius.circular(20),
                    )
                  ),
                )
              ],
            ),
            ),
            ),

            10.heightBox,
            Row(
              children: [
                Expanded(child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: textfieldGrey,
                      )
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide: BorderSide(
                        color: textfieldGrey,
                      )),
                    hintText: "Type a message...",
                  ),
                )),
                IconButton(onPressed: () {}, icon: const Icon(Icons.send, color: redColor)),
              ],
            ).box.height(80).padding(const EdgeInsets.all(12)).margin(EdgeInsets.only(bottom: 8)).make(),
          ],
        ),
    ),
    );
  }
}