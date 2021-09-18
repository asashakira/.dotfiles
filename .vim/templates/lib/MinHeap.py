class MinHeap:
    def __init__(self):
        self.heap = []

    def push(self, x):
        self.heap.append(x)
        self.heapify_up(len(self.heap)-1)

    def pop(self):
        self.heap[0] = self.heap[-1]
        self.heap.pop()
        self.heapify_down(0)

    def top(self):
        return self.heap[0]
    
    def empty(self):
        return len(self.heap) == 0

    def heapify_down(self, i):
        left  = 2*i + 1
        right = 2*i + 2
        small = i
        if left < len(self.heap) and self.heap[left] < self.heap[small]:
            small = left
        if right < len(self.heap) and self.heap[right] < self.heap[small]:
            small = right
        if small != i:
            self.heap[i], self.heap[small] = self.heap[small], self.heap[i]
            self.heapify_down(small)

    def heapify_up(self, i):
        par = (i-1)//2
        if i and self.heap[par] > self.heap[i]:
            self.heap[par], self.heap[i] = self.heap[i], self.heap[par]
            self.heapify_up(par)
