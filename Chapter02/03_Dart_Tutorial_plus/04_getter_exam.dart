void main() { 
  var obj = Mouse(); 
  obj.setWeight = 3; // setter로 데이터 수정
  print(obj.weight); // getter로 데이터 가져옴 
} 
 
class Mouse { 
  // Field 
  String name;  
  int privateWeight;

  // 외부에서 접근할 수 없는 데이터를 돌려준다.
  int get weight{
    return this.privateWeight;
  }

  // 외부에서 접근할 수 없는 데이터를 변경한다.
  set setWeight(int weight){
    this.privateWeight = weight;
    print('몸무게가 변경됐습니다!');
  }
} 
