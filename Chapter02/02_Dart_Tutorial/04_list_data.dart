void main() {
  List<int> growableList = [1, 2];
  growableList.length = 1;
  growableList.add(1004);
  print(growableList);

  var myListNumber = [1,2,3,4,5]; 
  var myListString = ["Choi","Jeong","Kim"]; 
  var myListBoth = ["Year",2019,"Month",10]; 
 
  print(myListNumber); 
  print(myListNumber.runtimeType); 
  print(myListString); 
  print(myListString.runtimeType); 
  print(myListBoth); 
  print(myListBoth.runtimeType); 

  var myList = ["Year",2019,"Month",10]; 
  
  print("길이: ${myList.length}"); 
  print("3번째 데이터: ${myList[3]}"); 
  myList[3] = 11; 
  print("변경된 후 리스트: ${myList}"); 
}
