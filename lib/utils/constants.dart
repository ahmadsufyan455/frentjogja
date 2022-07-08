// image parent
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../modules/auth/auth_controller.dart';

const image = 'assets/images';
const String facilities =
    '''Fasilitas sewa yang didapatkan antara lain:\n• Free pickup & delivery di lokasi terntentu 📌\n• Helm SNI 🪖\n• Jas Hujan ⛱''';
const String aboutQuotes =
    'Kami meluangkan waktu yang cukup untuk mengenal anda sehingga kami dapat membantu anda untuk menemukan tempat persewaan motor yg terbaik.';
const String about =
    'FRent Jogja memberikan fleksibiltas kepada anda untuk menentukan sistem sewa yang sesuai dengan kebutuhan anda. Anda dapat menyewa dengan sistem harian, mingguan, maupun bulanan.\n\nKami juga menyediakan layanan untuk antar dan ambil motor secara cuma-cuma sepanjang lokasi antar dan ambil berada di Stasiun Tugu, Stasiun Lempuyangan, Maliboro, Prawirotaman, Janti. Untuk lokasi antar dan ambil di luar wilayah tersebut, masih memungkinkan untuk kami antar secara gratis apabila kami nilai lokasi yang diminta setara dengan jarak Stasiun Tugu ke Janti.';
const address =
    '© 2022 Frent Jogja - Jl. Mawar V No. 8, Baciro, Gondokusuman, Yogyakarta. Telp: +6287838938806, +6287739772833';

// firebase configuration
AuthController authController = AuthController.instance;
final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp();
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
