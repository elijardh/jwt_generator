# JWT GENERATOR

## Overview

This package is used for generating JWT using rsa_pkcs and pointycastle

## FEATURES

- \*\*JWT GENERATOR Generates JWT

## Installation

For Dart use:

```bash
dart pub add jwt_manager
```

For Flutter use:

```
flutter pub add jwt_manager
```

You can manually edit your `pubspec.yaml `file this:

```yaml
dependencies:
  jwt_manager: ^0.0.1
```

You can run a `dart pub get` or `flutter pub get` for Dart and Flutter respectively to complete installation.

## Usage

**Example:**

```
import 'package:jwt_generator/jwt_generator.dart';

void main() {
// Creating a token
final tokenDto = FcmTokenDto(
iss: 'some@email.com',
iat: DateTime(2001),
);

final pemPrivateKey = '''
-----BEGIN RSA PRIVATE KEY-----
MIIBOQIBAAJAXWRPQyGlEY+SXz8Uslhe+MLjTgWd8lf/nA0hgCm9JFKC1tq1S73c
Q9naClNXsMqY7pwPt1bSY8jYRqHHbdoUvwIDAQABAkAfJkz1pCwtfkig8iZSEf2j
VUWBiYgUA9vizdJlsAZBLceLrdk8RZF2YOYCWHrpUtZVea37dzZJe99Dr53K0UZx
AiEAtyHQBGoCVHfzPM//a+4tv2ba3tx9at+3uzGR86YNMzcCIQCCjWHcLW/+sQTW
OXeXRrtxqHPp28ir8AVYuNX0nT1+uQIgJm158PMtufvRlpkux78a6mby1oD98Ecx
jp5AOhhF/NECICyHsQN69CJ5mt6/R01wMOt5u9/eubn76rbyhPgk0h7xAiEAjn6m
EmLwkIYD9VnZfp9+2UoWSh0qZiTIHyNwFpJH78o=
-----END RSA PRIVATE KEY-----
''';
final pemPublicKey = '''
-----BEGIN PUBLIC KEY-----
MFswDQYJKoZIhvcNAQEBBQADSgAwRwJAXWRPQyGlEY+SXz8Uslhe+MLjTgWd8lf/
nA0hgCm9JFKC1tq1S73cQ9naClNXsMqY7pwPt1bSY8jYRqHHbdoUvwIDAQAB
-----END PUBLIC KEY-----
''';

// Creating an encoded and signed token

// RsaKeyParser extracts private key from a pem string
final parser = RsaKeyParser();
final rsaPrivateKey = parser.extractPrivateKey(pemPrivateKey);

// Create RsaSignifier for signing
final rsaSignifier = RsaSignifier(privateKey: rsaPrivateKey);

// JwtBuilder encodes the token to string and signs it
final jwtBuilder = JwtBuilder(signifier: rsaSignifier);
final jwtToken = jwtBuilder.buildToken(tokenDto);

print('Encoded JWT: $jwtToken');

// Checking the signature with the public key

// Extract public key from a pem string
final rsaPublicKey = parser.extractPublicKey(pemPublicKey);

// Verifying the signature
final rsaVerifier = RsaSignatureVerifier(publicKey: rsaPublicKey);
final isVerified = rsaVerifier.verify(
'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzb21lQGVtYWlsLmNvbSIsInNjb3BlIjoiaHR0cHM6Ly93d3cuZ29vZ2xlYXBpcy5jb20vYXV0aC9maXJlYmFzZS5tZXNzYWdpbmciLCJhdWQiOiJodHRwczovL29hdXRoMi5nb29nbGVhcGlzLmNvbS90b2tlbiIsImV4cCI6OTc4Mjk2NDAwLCJpYXQiOjk3ODI5MjgwMH0',
'cqABcd-RMTQvxvI2zKPNek-UPd7fY0796B8hN9pDYyyrRWDOy7LlufaCvMlDIXrOS-zJMTsFbPQ8UMYY2Ofkz_lloCy4K5IhGZQIOjYvfhIZhp9PxMvj0XhRsezERQoK4air_lcUEh1LJ1o9j_i4P0XyOqGhcgcKKZLrc3zziSbb-vEIKu9gX4WsVYpyv4CK-o9AOAxXqukebcrIdURhf0V8o1hiVwTTfX5_x4j_XF99ZqjoFCTTcieM2F7F9-LFmwqy9Cg0E_UsyPC7aeR_UADLfE-1SBfYTSPdxAZ0HVfYQcET7hnzZJzz_NhyD62fLQzj6Eqag8_fWeZr_NYsPg');

print('Is signature verified: $isVerified');
}
```
