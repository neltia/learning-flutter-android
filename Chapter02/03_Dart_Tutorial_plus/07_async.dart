void main() { 
  print('First'); 
  get().then((data){ // then 문법을 사용해 get이 실행되고 결과가 반환되면 print 실행
    print(data); 
  }); 
  print('Third'); 
} 
 
Future<String> get(){ 
  return Future.delayed(Duration(seconds: 3), (){ 
    return 'Second'; 
  }); 
}
