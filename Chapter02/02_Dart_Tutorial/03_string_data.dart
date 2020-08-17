void main() {
  String mon = "Hello World!";
  print(mon);
  print(mon.runtimeType);

  var string = 'Dart is fun';
  var newString = string.substring(0, 5);
  print(newString);

  var dart1 = 'Dart ' + 'is ' + 'fun!';;
  var dart2 = 'Dart ' 'is ' 'fun!';
  print(dart1);
  print(dart2);

  var name  = '무지개';
  var dong  = 101;
  var ho  = 101;
  var address = '${name}아파트 ${dong}동 ${ho}호';
  print(address);
}