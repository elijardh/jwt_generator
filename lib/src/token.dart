/// Token interface
abstract class TokenDto {
  Map<String, Object> buildHeader();
  Map<String, Object> buildClaims();
}

/// Represents the Firebase Cloud Messaging (FCM) token and its associated JWT claims.
/// This class is used to store token data needed for constructing a JWT.
///
/// Example:
/// ```dart
/// FcmTokenDto token = FcmTokenDto(
///   alg: "RS256",
///   aud: "https://fcm.googleapis.com/",
///   additionalClaims: {"sub": "user123"},
/// );
/// ```
class FcmTokenDto implements TokenDto {
  FcmTokenDto({
    DateTime? exp,
    DateTime? iat,
    this.sub,
    this.uid,
    this.alg = 'RS256',
    this.typ = 'JWT',
    required this.iss,
    this.additionalClaims,
    this.scope = 'https://www.googleapis.com/auth/firebase.messaging',
    this.aud =
        'https://identitytoolkit.googleapis.com/google.identity.identitytoolkit.v1.IdentityToolkit',
  })  : exp = (iat ?? DateTime.now()).add(const Duration(hours: 1)),
        iat = iat ?? DateTime.now();

  /// The algorithm used for signing the JWT.
  /// Common values include 'RS256' (RSA Signature with SHA-256).
  final String alg;
  final String typ;

  final String iss;
  final String scope;

  /// The audience (aud) claim, representing the intended recipient of the token.
  /// In the context of FCM, this is often set to `https://fcm.googleapis.com/`.
  final String aud;
  final DateTime exp;
  final DateTime iat;
  final String? sub;
  final String? uid;

  /// Any additional claims to be added to the JWT payload.
  /// These claims can be custom data related to the user or device.
  final Map<String, dynamic>? additionalClaims;

  /// Constructs the JWT header.
  /// The header typically includes the algorithm (`alg`) and the token type (`typ`).
  @override
  Map<String, Object> buildHeader() {
    return {
      'alg': alg,
      'typ': typ,
    };
  }

  /// Constructs the token claims for the JWT payload.
  /// Combines predefined claims with any additional claims.
  @override
  Map<String, Object> buildClaims() {
    return {
      "iss": iss,
      "scope": scope,
      "aud": aud,
      "exp": exp.millisecondsSinceEpoch ~/ 1000,
      "iat": iat.millisecondsSinceEpoch ~/ 1000,
      if (sub != null) "sub": sub!,
      if (uid != null) "uid": uid!,
      if (additionalClaims != null) ...additionalClaims!,
    };
  }

  FcmTokenDto reissue() {
    final now = DateTime.now();
    return copyWith(iat: now, exp: now.add(const Duration(hours: 1)));
  }

  FcmTokenDto copyWith({
    String? alg,
    String? typ,
    String? iss,
    String? scope,
    String? aud,
    DateTime? exp,
    DateTime? iat,
  }) {
    return FcmTokenDto(
      alg: alg ?? this.alg,
      typ: typ ?? this.typ,
      iss: iss ?? this.iss,
      scope: scope ?? this.scope,
      aud: aud ?? this.aud,
      exp: exp ?? this.exp,
      iat: iat ?? this.iat,
    );
  }
}
