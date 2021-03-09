import 'dart:collection';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class JWT {
  Map _header;
  Map _claims;
  String _token;
  String _sig;

  Map get claims => _claims;

  Map get header => _header;

  String get token => _token;

  // Create a JWT from a base64 encoded string. There are 3 parts to the string - seperated with a "." character
  // The first part is the header - which is a map that indicates the crypto used for signing or encrypting the
  // claims. The second is the claims. The third part is the signature.s
  JWT.fromB64encodedString(String p) {
    var t = p.split(".");
    _header = _toJSON(t[0]);
    _claims = _toJSON(t[1]);
    _sig = t[2];
  }

  Map<dynamic,dynamic> _toJSON(String part) {
    var padded = part;
    // Dart b64 library does not like non padded encoding
    switch ((part.length % 4)) {
      case 1:
        padded = '${part}===';
        break;
      case 2:
        padded = '${part}==';
        break;
      case 3:
        padded = '${part}=';
        break;
      default: // nothing
    }
    var l = base64Decode(padded); //CryptoUtils.base64StringToBytes(padded);

    var s = ascii.decode(l);
    return json.decode(s);
  }

  JWT.createTokenString(Object claim) {
    _token = _createTokenString(claim);
  }

  String _createTokenString(Object claim) {
    String sig = "irocn.com";
    var hmac = new Hmac(sha256, sig.codeUnits);
    SplayTreeMap<String, String> header =
        new SplayTreeMap.from({"alg": "HS256", "typ": "JWT"});
    String headerString = base64UrlEncode(json.encode(header).codeUnits);
    String payloadString = base64UrlEncode(json.encode(claim).codeUnits);
    String data = headerString + "." + payloadString;
    List<int> signature = hmac.convert(data.codeUnits).bytes;
    var token = data + "." + base64UrlEncode(signature);
    return token;
  }

  String toString() => '${_header}${_claims}';
}
