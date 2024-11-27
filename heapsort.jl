using Random


"""
The heapify function imposes an implicit heap structure on the array a. 
    The children (left and right) of node i are 2*i and 2*i+1, respectively. The children are always smaller than their parent. 
    Constructing a in this manner lets us use heap sort in a later stage. 
"""
function heapify(a, heap_size, i)
    largest = i
    for offset in 0:1
        child = 2*i + offset
        if (child <= heap_size) && (a[child] > a[largest])
            largest = child
        end
    end

    if largest!=i
        a[i], a[largest] = a[largest], a[i]
        heapify(a, heap_size, largest)
    end
end

function build_heap(a)
    l = length(a)
    # The latter half of the array are leaf nodes and we do not need to heapify them. 
    for i ∈ (l ÷ 2):-1:1
        heapify(a, l, i)
    end
end

"""
    The heapsort function sorts the array a in ascending order. 
    It uses the heap sort algorithm which can be read about here:
    https://en.wikipedia.org/wiki/Heapsort

    This YouTube video was the source of the code, most of this code is basically Python translated Julia code.
    https://www.youtube.com/watch?v=2DmK_H7IdTo 

"""
function heapsort(a)
    l = length(a)
    # In a heapified array, the root is always the maximum element of the array. 
    # Exploit this by putting the root at the end of a and the re-heapify the unheapified array.
    for i ∈ l:-1:2
        a[1], a[i] = a[i], a[1]
        heapify(a, i-1, 1)
    end
end

#a = [7,9,3,4,5,121,12,41]
a = shuffle(1:22)
println("Shuffled array: ", a)
build_heap(a)
heapsort(a)
println("Heap sorted array: ", a)