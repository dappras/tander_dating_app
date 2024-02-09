import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  signInWithGoogle() async {
    var storage = GetStorage();

    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gauth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gauth.accessToken,
      idToken: gauth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    GoogleSignInAccount userCurrent = gUser;
    storage.write('user', userCurrent);

    return userCurrent;
  }
}
