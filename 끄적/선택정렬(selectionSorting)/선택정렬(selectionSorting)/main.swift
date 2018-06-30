//
//  main.swift
//  선택정렬(selectionSorting)
//
//  Created by 김민웅 on 2018. 6. 25..
//  Copyright © 2018년 김민웅. All rights reserved.
//

import Foundation

var arr = [5, 3, 7, 1, 6, 9, 2, 10, 13]

func selectionSort(input: inout [Int]) {
    
    for i in 0..<input.count {
        print("\(i + 1): ", input)
        var isSorted = true
        var min = i
        for j in  (i + 1)..<input.count {
            if input[min] > input[j]{
                min = j
                //                input.swapAt(i, min)
                //                isSorted = false
            }
        }
        input.swapAt(i, min)
        isSorted = false
        guard !isSorted else {break}
    }
}
selectionSort(input: &arr)
/*
 1:  [5, 3, 7, 1, 6, 9, 2, 10, 13]
 2:  [1, 3, 7, 5, 6, 9, 2, 10, 13]
 3:  [1, 2, 7, 5, 6, 9, 3, 10, 13]
 4:  [1, 2, 3, 5, 6, 9, 7, 10, 13]
 5:  [1, 2, 3, 5, 6, 9, 7, 10, 13]
 6:  [1, 2, 3, 5, 6, 9, 7, 10, 13]
 7:  [1, 2, 3, 5, 6, 7, 9, 10, 13]
 8:  [1, 2, 3, 5, 6, 7, 9, 10, 13]
 9:  [1, 2, 3, 5, 6, 7, 9, 10, 13]*/


//
////    print(i)
//    print("\(i + 1): ", arr[i])
//
//    for j in i + 1..<arr.count{
////        print(j)
//        print(arr[j])
//        var min = arr[j]
//        if i < j {
//
//        }
//    }
//}
