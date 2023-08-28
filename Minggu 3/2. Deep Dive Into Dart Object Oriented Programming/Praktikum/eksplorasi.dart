abstract class Shape {
  int getArea();
  int getPerimeter();
}

class Circle implements Shape {
  int radius = 0;
  Circle(int r) {
    this.radius = r;
  }

  @override
  int getArea() {
    double area = 22 / 7 * radius * radius;
    return area.round();
  }

  @override
  int getPerimeter() {
    double perimeter = 2 * 22 / 7 * radius;
    return perimeter.round();
  }
}

class Square implements Shape {
  int side = 0;
  Square(int s) {
    this.side = s;
  }

  @override
  int getArea() {
    return side * side;
  }

  @override
  int getPerimeter() {
    return side * 4;
  }
}

class Rectangle implements Shape {
  int width = 0;
  int height = 0;
  Rectangle(int w, int h) {
    this.width = w;
    this.height = h;
  }

  @override
  int getArea() {
    return width * height;
  }

  @override
  int getPerimeter() {
    return (width + height) * 2;
  }
}

void main() {
  Circle circle = Circle(10);
  print("circle area = ${circle.getArea()}");
  print("circle perimeter = ${circle.getPerimeter()}");

  Square square = Square(5);
  print("square area = ${square.getArea()}");
  print("square perimeter = ${square.getPerimeter()}");

  Rectangle rectangle = Rectangle(5, 7);
  print("rectangle area = ${rectangle.getArea()}");
  print("rectangle perimeter = ${rectangle.getPerimeter()}");
}
