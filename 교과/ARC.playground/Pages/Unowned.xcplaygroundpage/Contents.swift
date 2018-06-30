//: [Previous](@previous)
//: - - -
//: # Unowned
//: - - -

class Teacher {
  let name: String
  var student: Student?
  init(name: String) {
    self.name = name
  }
  deinit {
    print("Teacher is being deinitialized")
  }
}

class Student {
  let name: String
  //  let teacher: Teacher
  unowned let teacher: Teacher
  init(name: String, teacher: Teacher) {
    self.name = name
    self.teacher = teacher
  }
  deinit {
    print("Student is being deinitialized")
  }
}

var teacher: Teacher? = Teacher(name: "쌤")
var student: Student? = Student(name: "학생", teacher: teacher!)
teacher?.student = student


print("\n---------- [ teacher release ] ----------\n")
teacher = nil


print("\n---------- [ student release ] ----------\n")
//print(student?.teacher)       //unowned - 뎅글링포인트 라는걸로 접근을 하게 되서 이상한값으로...unowned를 주의해서 써야함
//print(student?.teacher)       //weak에서는 파괴된 객체에 접근할 때 nil이 뜸
student = nil



//: [Next](@next)
