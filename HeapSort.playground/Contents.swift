import Foundation

extension Array where Element: Comparable {
    
    
    func heapSorted() -> Array {
        var r = self
        
        func parent(_ i: Int) -> Int {
            return ((i+1) / 2) - 1
        }
        
        func leftChild(_ i: Int) -> Int {
            return ((i + 1) * 2) - 1
        }
        
        func rightChild(_ i: Int) -> Int {
            return leftChild(i) + 1
        }
        
        func maxHeapify(i: Int, limit: Int) {
            let leftIndex = leftChild(i)
            let rightIndex = rightChild(i)
            if rightIndex > limit || r[leftIndex] > r[rightIndex] {
                if leftIndex <= limit && r[leftIndex] > r[i] {
                    (r[leftIndex],r[i]) = (r[i],r[leftIndex])
                    maxHeapify(i: leftIndex, limit: limit)
                }
            } else if rightIndex <= limit {
                if r[rightIndex] > r[i] {
                    (r[rightIndex],r[i]) = (r[i],r[rightIndex])
                    maxHeapify(i: rightIndex, limit: limit)
                }
            }
        }
        
        func buildMaxHeap() {
            let lastParent = parent(r.count - 1)
            for i in (0...lastParent).reversed() {
                maxHeapify(i: i, limit: r.count - 1)
            }
        }
        
        func sortFromHeap() {
            for i in (1..<r.count).reversed() {
                (r[0],r[i]) = (r[i],r[0])
                maxHeapify(i: 0, limit: i-1)
            }
        }

        
        buildMaxHeap()
        sortFromHeap()
        
        return r
    }
    
}

var elements = [13,8,0,3,6,9,12,1,4,5,7,10,2,11]
elements.heapSorted().forEach{print($0, terminator: " ")}

