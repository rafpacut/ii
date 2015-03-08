import math
def First(x):
    
    #added +- 1 accordingly to left and right to prevent infinite loop
    #It is O(log_2(n)) already

    a = []
    #populating an array:
    for j in xrange(0,20):
        a.append(j)

    left = 0
    right = len(a) - 1
    while left < right:
        middle = (left+right)/2
        if a[middle] < x:
            left = middle + 1
        else:
            right = middle - 1

    return left 


def Second():
    #selection sort

    #populate array to sort
    array = [1,0,12,6,8,299]
    last_index = len(array)

    for i in xrange(0,last_index):
        minimum_index = i

        for j in xrange(i+1,last_index):
            if array[j] < array[minimum_index]:
                minimum_index = j

        #swap the values
        tmp = array[i]
        array[i] = array[minimum_index]
        array[minimum_index] = tmp


    for x in array:
        print x

#It's O(n^2), becouse for every element in array we have to do at average n^2/2 comparisons
#The dominant operation here is the value comparison operation (if array[j] < array[minimum_index]
#array sorted a_1 <= a_n: n^2/2 comparisons, 0 movings
#             a_1 >= a_n: n^2/2 comparisons, n-1 movings


def Third():
    #bubble sort

    #populate the array to sort
    array = [1,0,12,6,8,299]
    last_index = len(array)
    swapped = False
    
    while not swapped:

        for i in xrange(0,last_index-1):

            if array[i] > array[i+1]:
                tmp = array[i]
                array[i] = array[i+1]
                array[i+1] = tmp
                swapped = True

    for el in array:
        print el

#It's O(n^2), becouse worst case is array sorted ascending, then for each element
# we have to make on average n-1 swaps. Which gives us n^2/2 complexity.
#The dominant operation is comparison.
#d) ascending order: 0comparisons
#   descending order: n^2


def Fifth(n):
    
    #It should range from 2 to square root of n
    #array of candidates:
    array = []
    for i in xrange(0,n):
        array.append(1)

    last_index = len(array) - 1


    for index in xrange(2,last_index):
        if array[index] == 1:
            for i in xrange(2,last_index):
                #czy jest w S
                #   wywal
                #else
                #   przerwij

                multiple = index*i
                if multiple <= last_index:
                    array[multiple] = 0
                else:
                    break

    for i in xrange(2,n):
        if array[i] == 1:
            print i

    











































