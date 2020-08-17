void main(){
  int num1 = 1;
  num1 += 1; // num1에 1을 더하고 num1에 다시 저장한다.
  print(num1);

  int score = null;
  score ??= 1; 
  print(score);
}
