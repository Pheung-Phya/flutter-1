abstract class Animal {
  void show() {
    print('Animal show');
  }
  void eat();
}

class Dog extends Animal {
  void bark() {
    print('I am barking');
  }

  void show1() {
    print('Dog show');
  }

  @override
  void eat() {
    print('Dog eating rice');
  }
}

class Cat extends Animal {
  void meow() {
    print('I am meowing');
  }

  @override
  void eat() {
    print('Cat eating fish');
  }
}

void main(List<String> args) {
  Animal animal = Dog();
  animal.eat();

  animal = Cat();
  animal.eat();

  animal.show();
}
