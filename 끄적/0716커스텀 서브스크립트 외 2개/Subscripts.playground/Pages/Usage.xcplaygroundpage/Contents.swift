//: [Previous](@previous)
//: # Usage

print("\n---------- [ TimesTable ] ----------\n")

struct TimesTable {
  let multiplier: Int
  subscript(index: Int) -> Int {
    return multiplier * index
  }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")

let sevenTimesTable = TimesTable(multiplier: 7)
print("five times seven is \(sevenTimesTable[5])")



print("\n---------- [ Matrix ] ----------\n")

struct Matrix {
  let rows: Int, columns: Int
  var grid: [Double]
  
  init(rows: Int, columns: Int) {
    self.rows = rows
    self.columns = columns
    grid = Array(repeating: 0.0, count: rows * columns)
  }
  
  func indexIsValid(row: Int, column: Int) -> Bool {
    return row >= 0 && row < rows && column >= 0 && column < columns
  }
  
  subscript(row: Int, column: Int) -> Double {
    get {
      assert(indexIsValid(row: row, column: column), "Index out of range")
      return grid[(row * columns) + column]
    }
    set {
      assert(indexIsValid(row: row, column: column), "Index out of range")
      grid[(row * columns) + column] = newValue
    }
  }
}


var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 1] = 1.54
matrix[1, 0] = 3.25
print(matrix)

// matrix[2, 2] = 5.0   // Assertion failed


//: [Next](@next)
