/* // ignore_for_file: non_constant_identifier_names

class GoogleSignInDataModel {
  final String email;
  final String fullname;
  final String type;
  final String google_id;
  final String google_verification_code;

  GoogleSignInDataModel({
    required this.email,
    required this.fullname,
    required this.type,
    required this.google_id,
    required this.google_verification_code,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'fullname': fullname,
      'type': type,
      'google_id': google_id,
      'google_verification_code': google_verification_code,
    };
  }
}
 */