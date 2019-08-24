import sys
import math

def euclidian_norm(array, sum):
    if len(array) == 0:
        return sum
    else:
        sum += (array[0]*array[0])
        array.pop()
        return euclidian_norm(array, sum)    


norm = euclidian_norm([1, 1, 1, 1], 0)
print(math.sqrt(norm))