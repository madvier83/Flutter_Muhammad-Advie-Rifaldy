class Course {
  var judul;
  var deskripsi;
}

class Student {
  var nama;
  var kelas;
  List<Course> courses = [];

  void addCourse(Course course) {
    courses.add(course);
  }

  void deleteCourse(Course course) {
    for (var i = 0; i < courses.length; i++) {
      if (course == courses[i]) {
        courses.removeAt(i);
      }
    }
  }

  void printCourse() {
    courses.forEach((element) {
      print(element.judul);
      print(element.deskripsi);
      print("-");
    });
  }
}

void main() {
  var flutter = Course();
  flutter.judul = "2023 Complete Front-End Engineer Career with Flutter";
  flutter.deskripsi = "Lorem ipsum dolor sit amet, adipiscing elit.";
  var react = Course();
  react.judul = "2023 Complete Front-End Engineer Career with ReactJS";
  react.deskripsi = "Lorem ipsum dolor sit amet, consectetur adipiscing elit.";

  var advie = Student();
  advie.nama = "Advie Rifaldy";
  advie.kelas = "SIB-5_Flutter A";

  print("-- Add 2 course --");
  advie.addCourse(flutter);
  advie.addCourse(react);
  advie.printCourse();

  print("-- Remove 1 course --");
  advie.deleteCourse(react);
  advie.printCourse();
}
