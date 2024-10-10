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

  //This private key was AI Generated
  final pemPrivateKey = '''
-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAy1YRVTIxeB6YU88f6OhsHtZUB0ll/9Wi72lgzohPRHkHHb3J
y193Y41wmtYNhxY9GHQ6QjciXP4LtQUqf+WOf70O9x3xDJLPuHx8Zw25Cz+S4r0t
KnSNnh7gBi0QJ5PYv+gIJxgV/QlQFVencXbpaohkU/LInxVMoo8bkta160OOBSW2
5JBSxF8tY49SDfxcLyh91BD+E/8cOplGAXaYyPbsVUn76Y83JZ+jIzZWXNvap9Xq
SbfqXzjVQuOQ/XdrQOS5u1c+F6OzWgdSa7OBj479yzfuh7z+W+NpZAKjFihvh1ME
nnLd61Htu/1D5/L/zkv+lZ5sjAps0aWRkwZ+CQIDAQABAoIBADI8BjY1G1GgxWNX
NXv2B9gqfUH7mS52WjWppBgCRwsUl3R6keMjp7w5kks+fMMV9GwZMtdvBZdR0BSd
vR0x2l2mmI7mn8nKb3UVlCplkoS75Q8NS55Eg0RAPnpoIaiVdyQaMAFwiuYjqdxL
9nsqtIn0Pk0bGwNqYK98iYRidTk026KsYrZGSb/Ya0DlBJYOMQnDslPmebGgbZro
9opVaceLpYaklQa2Q7cF4M2MRcKAK//wb2t2aPQ+LmtZGfnyW0z/ZZB8loaMClCU
k0vLcRPt8OuzGUO+9it8GT9JjW59HTEhYtkBs9dLr3yWeSOiUraienNGAEwRSALe
sYyFiTECgYEA5ITum3Vw339C5KByBek3wmFSWhxokgtJfUe33hgqFeSB4Cs8rJri
B8zc00q4WSoXWH7zz/lJm4DCUHl+U7ycppQYovVfuoegXC784uihW4XwPWc4r3yH
agpNancSkLVkWznDGafpQxq7YbK21hYdVRoaw9Y36fO1/9zw+xIHJGUCgYEA48nd
HoXL0v062IdoJ/dgm+RO97iYCDtVzRCYvv65Toa0n5mA+W6IFcJzKFWjE8/eiqoV
/Vl+UXu8QG0g6elVgdHEyoR5ZzX5jjaNl4ZAyzY9Oubh3pj8N6xq1deAOjjBPQNZ
z+NRchG43GJ7m0Z7lajmaMc0PLVNe7SUY7sF/tUCgYBEoriX8LoqJqsMyDP3Goko
1NpLPmUaGFHGUxgimNdrI+ruTY43uX1SInHg9HxSK5Y/ekH4oUM+dXnnedY7iFb0
oV6U82YBPGMpzOMftAdi2ePCTZJ1As4ZR2bhJ0poNFMkI0E6H3isMwc83NSVkKbW
vLR1RY4dspljdBTdFBkZEQKBgGzzNlHNCOpHuIesbEMBbTHjB2ow3nbBeo50q7pe
t185ytazYx7qoShXMyFNpIxrVjPYml/tGB/9INNn3uBCfGV1YbzDlBWrmUtOCHc6
/W606KBtogcIAUrXqtnRE0HFt5dpLOHkBiabF2JBsIFaOu4gNORUs0V+KitK+dah
s4JpAoGAd+YLoCWwe+2P7EqhiGi0eUcqFyTvOsxxRCTsBWWkf2P0SorjjYcmlw2G
iLxH64ZqxyJNdI1wYkGYVxoTdB5jFRP3X7QPDv5v0iMs6iLX0e3XHkUQZSpij2rq
UmUIGqLdAx3FNG0CO/HLr+kc8vkeDTkBKYtDm4r9Ik9IquF4MUc=
-----END RSA PRIVATE KEY-----
''';

//This public key was AI generated
  final pemPublicKey = '''
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAy1YRVTIxeB6YU88f6Ohs
HtZUB0ll/9Wi72lgzohPRHkHHb3Jy193Y41wmtYNhxY9GHQ6QjciXP4LtQUqf+WO
f70O9x3xDJLPuHx8Zw25Cz+S4r0tKnSNnh7gBi0QJ5PYv+gIJxgV/QlQFVencXbp
aohkU/LInxVMoo8bkta160OOBSW25JBSxF8tY49SDfxcLyh91BD+E/8cOplGAXaY
yPbsVUn76Y83JZ+jIzZWXNvap9XqSbfqXzjVQuOQ/XdrQOS5u1c+F6OzWgdSa7OB
j479yzfuh7z+W+NpZAKjFihvh1MEnnLd61Htu/1D5/L/zkv+lZ5sjAps0aWRkwZ+
CQIDAQAB
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

  // Split the jwt using the period as a seperator
  List<String> rawJwt = jwtToken.split('.');

  // pick the last index as the base64signature
  String base64signature = rawJwt.last;

  // Remove the last item on the list
  rawJwt.removeLast();

  // join the remain values using the period as a pattern
  String signedData = rawJwt.join('.');

  final isVerified = rsaVerifier.verify(signedData, base64signature);

  //Log the value
  print('Is signature verified: $isVerified');
}
```
