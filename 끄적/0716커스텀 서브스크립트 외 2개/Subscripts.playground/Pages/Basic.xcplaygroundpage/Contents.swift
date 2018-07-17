/*:
 # Subscripts
 - Class, Struct, Enum 에서 콜렉션, 순열, 리스트 등의 멤버 요소에 쉽게 접근하기 위한 방법
 - 별도의 메서드를 구성하지 않고도 인덱스를 통해 어떤 값을 빠르게 설정(set)하고 검색(retrieve) 가능
 - Subscript Overloading : 하나의 타입에 여러 개의 Subscripts(첨자) 정의 가능하며 전달 Index의 타입으로 구분
 */


Array<Int>()
var arr = [1, 2, 3, 4, 5]
arr[0]
arr[1]
arr[4] = 1

Dictionary<String, String>()
var dict = ["A": "Apple", "B": "Banana"]
dict["A"]
dict["B"]
dict["C"] = "Cherry"


//: ---
//: ## Subscript Syntax
//: ---

class SomeClass {
  subscript(index: Int) -> Int {
    get {
      // return an appropriate subscript value here
      return 0
    }
    set {
      // perform a suitable setting action here
    }
  }
}




//: [Next](@next)
