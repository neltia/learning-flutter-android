void main() { 
  var obj = Mouse('big mouse', 1); 
} 
 
class Mouse { 
  // Field 
  String name; 
  int age; 
 
  // Constructor 
  Mouse(String name, int age) { 
    this.name = name; 
    this.age = age;
    print(this.name); 
    print(this.age);
  } 
 
  // function(method) 
  eat() { print('mouse eats'); } 
  sleep() { print('mouse sleeps'); } 
} 
