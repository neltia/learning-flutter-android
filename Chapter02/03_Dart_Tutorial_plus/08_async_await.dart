void main() async{ 
  print('First'); 
   
  await get().then((data){ 
    print(data); 
  }); 
   
  print('Third'); 
} 
 
Future<String> get(){ 
  return Future.delayed(Duration(seconds: 3), (){ 
    return 'Second'; 
  }); 
}
