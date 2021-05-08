import 'package:INSCO_COMMUNITY/repo/firebase_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataFromFirebase extends FirebaseGetData {
  final firestore = FirebaseFirestore.instance;

  @override
  Future<Map<String, dynamic>> getUserData(
      String documentId, String collection) async {
    final userData =
        await firestore.collection(collection).doc(documentId).get();
    final json = userData.data();
    return json;
  }
}
