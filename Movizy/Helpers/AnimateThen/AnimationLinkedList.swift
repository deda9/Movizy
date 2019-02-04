class AnimationLinkedList {
    var head: Node?
    var tail: Node?
    
    var isEmpty: Bool {
        return (head == nil && tail == nil)
    }
    
    class Node {
        var value: Animation
        var next: Node?
        
        init(value: Animation) {
            self.value = value
            self.next = nil
        }
    }
    
    func append(_ value: Animation) {
        let node = Node(value: value)
        if self.head == nil {
            self.head = node
        } else {
            self.tail?.next = node
        }
        
        self.tail = node
    }
}
