import 'dart:convert';

convertSqlToJson(dynamic jsonString) {
  var str = jsonString.replaceAll('=', ":");
  var kv = str.substring(0, str.length - 1).substring(1).split(",");
  final Map<String, String> pairs = {};
  for (int i = 0; i < kv.length; i++) {
    var thisKV = kv[i].split(":");
    pairs[thisKV[0]] = thisKV[1].trim();
  }
  var encoded = json.encode(pairs);
  Map<String, dynamic> valueMap = json.decode(encoded);
  return valueMap;
}
