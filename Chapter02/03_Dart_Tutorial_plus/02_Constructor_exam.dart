void main() { 
  var obj = Mouse(); 
  obj.eat(); 
} 
 
class Mouse { 
  // Field 
  String name; 
  int age; 
 
  // function(method) 
  eat() { print('mouse eats'); } 
  sleep() { print('mouse sleeps'); } 
} 
