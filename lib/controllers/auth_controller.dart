import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electro_app/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
var isLoading = false.obs;
  //textcontroller
  var emailController = TextEditingController();
    var passwordController = TextEditingController();

  Future<UserCredential?> loginMethod({context}) async{
    UserCredential? userCredential;
    try {
      userCredential = await auth.signInWithEmailAndPassword(email:emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

   Future<UserCredential?> signupMethod({email, password, context}) async{
    UserCredential? userCredential;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(email:email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

// storing data method
  storeUserData({name, password, email}) async {
    // DocumentReference store = firestore.collection(usersCollection).doc(currentUser!.uid);
    // store.set({'name': name, 'password': password, 'email': email, 'imageUrl': '','id': currentUser!.uid,
    // 'cart_count': "00",
    // 'wishlist_count': "00",
    // 'order_count': "00",
    // },);
    CollectionReference users = firestore.collection(usersCollection);
      users.add({
    'name': name,
    'password': password,
    'email': email,
    'imageUrl': '',
    'id': currentUser!.uid,
    'cart_count': "00",
    'wishlist_count': "00",
    'order_count': "00",
  });
  }

  //signout method
    signoutMethod(context) async {
      try {
        await auth.signOut();
         VxToast.show(context, msg: "Signed out successfully.");
      } catch (e) {
        VxToast.show(context, msg: e.toString());
      }
    }
} 