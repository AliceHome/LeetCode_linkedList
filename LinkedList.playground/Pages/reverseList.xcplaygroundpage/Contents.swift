//: [Previous](@previous)

import Foundation

//:# 反转链表

public class ListNode {
    
    var value: Int
    var next: ListNode?
    
    init(_ value: Int) {
        self.value = value
    }
}


extension ListNode: CustomStringConvertible {
    public var description: String {
        return "\(value)"
    }
}

public class SingleList {
    
    fileprivate var head: ListNode?
    private var tail: ListNode?
    
    public var first: ListNode? {
        return head
    }
    
    public var last: ListNode? {
        return tail
    }
    
    public func append(_ value: Int) {
        
        let newNode = ListNode.init(value)
        
        if let tailNode = tail {
            tailNode.next = newNode
        }else {
            head = newNode
        }
        tail = newNode
    }
}


extension SingleList: CustomStringConvertible {
    public var description: String {
        
        var text = "["
        var node = head
        
        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil { text += " -> " }
        }
        
        return text + "]"
    }
}

func reverseList(_ head: ListNode?) -> ListNode? {
    
    var newNode = head
    var preNode: ListNode?
    while newNode != nil {
        
        var nextNode: ListNode?
        
        if let node = newNode {
            nextNode = node.next
            node.next = preNode
            preNode = node
        }
        newNode = nextNode
    }
    
    
    return preNode
}


func reverseList2(_ head: ListNode?) -> ListNode? {
    
    if head?.next == nil  {
        return head
        
    }else {
        let temp = head?.next
        head?.next = nil
        let node = reverseList(temp)
        temp?.next = head
        
        return node
    }
}



func testReverseList() {
    
    let list = SingleList()
    
    list.append(1)
    list.append(2)
    list.append(3)
    list.append(4)
    list.append(5)
    
    let list2 = SingleList()
    
    list2.append(1)
    list2.append(2)
    list2.append(3)
    list2.append(4)
    list2.append(5)
    
     let newList = reverseList2(list.first)
//    let newList = reverseList(list.first)

    assert(newList?.value == list2.last?.value, "首尾元素相等")
    assert(newList?.next?.value == list2.first?.next?.next?.next?.value, "倒数第二个元素相等")
    assert(newList?.next?.next?.value == list2.first?.next?.next?.value, "倒数第三个元素相等")
    assert(newList?.next?.next?.next?.value == list2.first?.next?.value, "倒数第四个元素相等")
    assert(newList?.next?.next?.next?.next?.value == list2.first?.value, "倒数第五个元素相等")
    
    
}

testReverseList()

//: [Next](@next)
