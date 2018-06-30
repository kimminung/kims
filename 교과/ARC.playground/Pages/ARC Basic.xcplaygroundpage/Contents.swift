//: [Previous](@previous)
/*:
 # ARC Basic
 */

class Person {
  let testCase: String
  init(testCase: String) {
    self.testCase = testCase
  }
  deinit {
    print("\(testCase) is being deinitialized")
  }
}


/*:
 ---
 ### case 1. Allocation & Release
 ---
 */
print("\n---------- [ Case 1 ] ----------\n")

//   스텍값         |      힙값                |
var obj1: Person? = Person(testCase: "case1")   //count 1
obj1 = nil  //count == 0 -> release     // Person(testCase: "case1")가 메모리에서 해제 된다.


/*:
 ---
 ### case 2. 참조 카운트 증가
 ---
 */
print("\n---------- [ Case 2 ] ----------\n")

var obj2: Person? = Person(testCase: "case2")
var countUp = obj2
//[obj2 retain]     //rc 2          //ob-c타입

obj2 = nil      //rc 1      //이거만 해주면 안뜸
countUp = nil   //rc 0      //이거까지 해주면 뜸

//[obj2 release]                    //ob-c타입
//[obj2 release]                    //ob-c타입

/*:
 ---
 ### case 3. Collection 에 의한 참조 카운트
 ---
 */
print("\n---------- [ Case 3 ] ----------\n")

var obj3: Person? = Person(testCase: "case3")
var array = [obj3]

//obj3 = nil              //예제에서는 nil을 넣어서 실제로는 클래스 내부의 var obj3, array가 클래스의 사라짐과 동시에 nil의 효과를
                        //내니까 표현하기 위함
//array.remove(at: 0)         //어레이도 해줌


/*:
 ---
 ### case 4. 강한 참조, 약한 참조
 - strong : 기본값. 강한 참조. Reference Count 1 증가
 - unowned : 약한 참조. Count 증가하지 않음. 참조 객체 해제 시에도 기존 포인터 주소 유지
 - weak : 약한 참조. Count 증가하지 않음. 참조하던 객체 해제 시 nil 값으로 변경
 ---
 */
print("\n---------- [ Case 4 ] ----------\n")

var strongObj4 = Person(testCase: "case4")  //rc = 1
weak var weakObj4 = Person(testCase: "case4")//rc = 0   //주소값이 파괴되어서 nil이 된다
unowned var unownedObj4 = Person(testCase: "case4")//rc = 0 //파괴된 주소값을 가지고 있으니 이상한값때문에 에러

//print(strongObj4.testCase)  //ok
//print(weakObj4?.testCase)   //nil
//print(unownedObj4.testCase) //error

//print(strongObj4)  //ok
//print(weakObj4)   //nil
//print(unownedObj4) //error



/***************************************************
 unowned. weak  -  let , var
 ***************************************************/

// 다음 4개 라인 중 사용 가능한 라인은?

unowned let unownedLet = strongObj4
unowned var unownedVar = strongObj4
//weak let weakLet = strongObj4     //불가 - 값이 파괴되면 nil로 변경되어야하는데 let일때는 불가능
weak var weakVar = strongObj4


// unowned 와 weak 의 타입은?
type(of: unownedVar)
type(of: weakVar)


//: [Next](@next)
