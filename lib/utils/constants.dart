// image parent
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../modules/auth/auth_controller.dart';

const image = 'assets/images';
const String facilities =
    '''Fasilitas sewa yang didapatkan antara lain:\n• Free pickup & delivery di lokasi terntentu 📌\n• Helm SNI 🪖\n• Jas Hujan ⛱''';

// firebase configuration
AuthController authController = AuthController.instance;
final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp();
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
