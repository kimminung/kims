//: [Previous](@previous)
/*:
 **function** - named code block
 
 **closure** - unnamed code block (lambdas)
 */
//: ## Basic Closure
print("\n---------- [ Basic ] ----------\n")
let simpleClosure = {
  print("This is SimpleClosure!!")
}
simpleClosure()


let closureParameter = { (str: String) -> Int in
  return str.count
}
let count = closureParameter("Swift")
print(count)


func voidFunction() {
  print("1")
}
let var1 = voidFunction
let var2: ()->() = {
  print("1")
}
var1()
var2()


({
  print("This is closure")
})()

/*:
 ## Inline closure
 */
print("\n---------- [ Inline ] ----------\n")
func printSwift() {
  print("Swift")
}
let arg = {
  print("Inline Closure!!")
}
func closureParamFunction(closure: () -> Void) {
  closure()
}
closureParamFunction(closure: printSwift)
closureParamFunction(closure: arg)
closureParamFunction(closure: {
  print("explicit closure parameter name")
})

/*:
 ## Trailing Closure
 */
print("\n---------- [ Trailing ] ----------\n")
closureParamFunction() {
  print("Trailing")
}

closureParamFunction {
  print("Trailing")
}

func closureParamFunction2(closure1: () -> Void, closure2: () -> Void) {
  closure1()
  closure2()
}

closureParamFunction2(closure1: {
  print("inline")
}, closure2: {
  print("inline")
})

closureParamFunction2(closure1: {
  print("inline")
}) {
  print("trailing")
}
/*:
 ## Syntax Optimization
 */
print("\n---------- [ Syntax Optimization ] ----------\n")
func performClosure(param: (String) -> Int) {
  print(param("Swift"))
}

performClosure(param: { (str: String) -> Int in
  return str.count
})

performClosure(param: { (str: String) in
  return str.count
})

performClosure(param: { str in
  return str.count
})

performClosure(param: {
  return $0.count
})

performClosure(param: {
  $0.count
})

performClosure(param: ) {
  $0.count
}

performClosure() {
  $0.count
}

performClosure { $0.count }

//: [Next](@next)
