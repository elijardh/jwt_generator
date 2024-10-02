/// Token interface
abstract class TokenDto {
  Map<String, Object> buildHeader();
  Map<String, Object> buildClaims();
}

/// Firebase cloud messaging token
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
  final String alg;
  final String typ;

  final String iss;
  final String scope;
  final String aud;
  final DateTime exp;
  final DateTime iat;
  final String? sub;
  final String? uid;
  final Map<String, dynamic>? additionalClaims;
  @override
  Map<String, Object> buildHeader() {
    return {
      'alg': alg,
      'typ': typ,
    };
  }

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
