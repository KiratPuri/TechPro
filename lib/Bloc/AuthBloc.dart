import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthBloc {

  AuthBloc(){Firebase.initializeApp();}

  final authService = AuthService();
  final googleSignin = GoogleSignIn(scopes: ['email']);

  Stream<User?> get currentUser => authService.currentUser;

  loginGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignin.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken
      );

      //Firebase Sign in
      final result = await authService.signInWithCredential(credential);

      print('${result.user!.displayName}');

    } catch(error){
      print(error);
    }
  }

  logout() {
    authService.logout();
  }
}

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<UserCredential> signInWithCredential(AuthCredential credential) =>
      _auth.signInWithCredential(credential);
  Future<void> logout() => _auth.signOut();
  Stream<User?> get currentUser => _auth.authStateChanges();
}
