import 'dart:convert';
import 'package:crypto/crypto.dart';

class GoogleSignInHashGenerator {
  String generateGoogleVerificationCode(String id, String email) {
    // Concatenar o ID e o e-mail
    String combinedString = '$id$email';

    // Calcular o hash usando o algoritmo SHA-256
    var bytes = utf8.encode(combinedString);
    var digest = sha256.convert(bytes);

    // Converter o resultado do hash em uma string hexadecimal
    String hash = digest.toString();

    return hash;
  }
}
