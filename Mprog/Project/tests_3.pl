% Tests for task 3, swaty
% VERSION: 0.2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

taskArity(3). % 3 is the number of input arguments, solve has arity 4

testSimpleSolution(Correct, Result) :-
  sort(Result, SortedResult),
  sort(Correct, SortedCorrect),
  SortedCorrect == SortedResult.

simple_test(7, 7, [ ((2,3), (7,1)), ((5,1),(6,3)), ((1,6),(6,6)), ((1,7),(7,2)), ((2,6),(5,5))], [[(2,3),(2,2),(3,2),(4,2),(5,2),(6,2),(6,1),(7,1)], [(5,1),(4,1),(3,1),(2,1),(1,1),(1,2),(1,3),(1,4),(2,4),(3,4),(3,3),(4,3),(5,3),(6,3)], [(1,6),(1,5),(2,5),(3,5),(4,5),(4,4),(5,4),(6,4),(6,5),(6,6)], [(1,7),(2,7),(3,7),(4,7),(5,7),(6,7),(7,7),(7,6),(7,5),(7,4),(7,3),(7,2)], [(2,6),(3,6),(4,6),(5,6),(5,5)]] ).

count_test(5,5, [ ((1,1),(1,5)), ((2,1), (2,5)), ((3,1),(3,5)), ((4,1),(4,5)), ((5,1),(5,5))], 1).
count_test(5,5, [ ((1,1),(2,5)), ((2,1), (1,5)), ((3,1),(3,5)), ((4,1),(4,5)), ((5,1),(5,5))], 0).
count_test(4,4, [ ((1,1),(4,4)), ((1,2), (3,4)), ((1,3), (2,4))], 4).


student_simple_test(2, 2, [((1,1),(2,2))], [(1,1), (2,1), (2,2)]).