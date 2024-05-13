// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:google_sign_in/google_sign_in.dart';
import 'package:kipiteu_app/security/google_security/google_sign_in_security/google_sign_in_hash_generator.dart';
import 'package:kipiteu_app/services/google_services/google_sign_in_service/google_sign_in_to_backend.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();
final GoogleSignInHashGenerator hashGenerator = GoogleSignInHashGenerator();

Future<LoginResponse?> GoogleSignInAPIService() async {
  try {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      String google_id = googleSignInAccount.id;
      String? displayName = googleSignInAccount.displayName;
      String type = 'google';
      String email = googleSignInAccount.email;
      String google_verification_code =
          hashGenerator.generateGoogleVerificationCode(google_id, email);
      print('Google Verification Code: $google_verification_code');

      final response = await sendSignInDataToBackend(
          email, displayName!, type, google_id, google_verification_code);

      if (response != null) {
        print('Token: ${response.token}');
        print('Email: ${response.email}');
        print('Nome: ${response.fullname}');
      }

      return response;
    } else {
      return null;
    }
  } catch (error) {
    print('Erro ao fazer login com o Google: $error');
    return null;
  }
}
