import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CloudFire {
  final storageRef = FirebaseStorage.instance.ref();
  final CollectionReference nameref = FirebaseFirestore.instance.collection('name');
  final CollectionReference bugref = FirebaseFirestore.instance.collection('name');

  Future<void> makeUser(UserCredential? userCred, name) async {
    if(userCred!= null && userCred.user != null){
      await FirebaseFirestore.instance.collection("UserModel").doc(userCred.user!.email).set({
        'name' : name.text,
        'email' : userCred.user!.email,
        'bio' : '',
        'admin' : false,
      });
    }
  }

  Future<void> createBug(String docId, String newName, String usern, String biostr, String twit, String git, String linked) {
    return nameref.doc(docId).update({
        'name': newName, 
        'usern' : usern,
        'bio': biostr,
        'twit' : twit,
        'git' : git,
        'linked' : linked,

      }
    );
  }

  // Future<void> updateUser(String docId, String newName, String usern, String biostr, String twit, String git, String linked) {
  //   return nameref.doc(docId).update({
  //       'name': newName, 
  //       'usern' : usern,
  //       'bio': biostr,
  //       'twit' : twit,
  //       'git' : git,
  //       'linked' : linked,

  //     }
  //   );
  // }

}