import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:orbital_app/models/user.dart';
import 'package:orbital_app/services/geolocation_service.dart';
import 'service_locator.dart';
import 'auth_service.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

class DatabaseService {

  final geo = Geoflutterfire();
  static final AuthService _auth = serviceLocator<AuthService>();

  //Collection reference
  final CollectionReference users = FirebaseFirestore.instance.collection('User');

  String getUID() {
    return _auth.getUID();
  }

  Future<void> initialiseUserData(String name) async {
    return await users.doc(getUID()).set({
      'Username' : name,
      'PicUrl' : '',
    });
  } // things that are tied to the user themselves
  
  Future<void> updateUserData(String name) async {
    return await users.doc(getUID()).update({
      'Username' : name,
    });
  }
  Future<void> updateUserPic(String url) async {
    return await users.doc(getUID()).update({
      'PicUrl' : url,
    });
  }

  IndividualData _dataFromSnapshot(DocumentSnapshot snapshot) {
    return IndividualData(
      uid: getUID(),
      name: (snapshot.data() as Map)['Username'],
      picUrl: (snapshot.data() as Map)['PicUrl'],
    );
  }

  Stream<IndividualData> get userData {
    return users.doc(getUID()).snapshots()
      .map(_dataFromSnapshot);
  }

   Future<IndividualData> getSenderData(String senderUID) async {
    DocumentSnapshot temp =  await users.doc(senderUID).get();
    var res =  IndividualData(
      picUrl: temp.get('PicUrl'),
      name: temp.get('Username'),
      uid: senderUID,
    );
    print(res.name);
    return res;
  }
}