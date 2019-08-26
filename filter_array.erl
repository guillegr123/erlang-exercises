% =================================================================================================
% Filter a given array of integers and output only those values that are less than a specified
% value X. The output integers should be in the same sequence as they were in the input. You need
% to write a function with the recommended method signature for the languages mentioned below. For
% the rest of the languages, you have to write a complete code.
%
% Input Format
% ------------
% The first line contains the delimiter X.
% The next B lines each contain an integer, which represents the elements of the list/array. You
% have to read the input to the End-Of-File.
%
% Output Format
% -------------
% Print all the integers from the array that are less than the given upper limit X in value on
% separate lines. The sequence should be the same as it was in the original array.
%
% Constraints
% -----------
% 1 <= B <= 100
% For any element Y in the array, -100 <= Y <= 100
% -100 <= X <= 100
%
% Note
% ----
% The purpose of this challenge is to learn how to write your own implementation of a filter
% function. We recommend not using the inbuilt library function.
%
% Sample Input
% ------------
% 3
% 10
% 9
% 8
% 2
% 7
% 5
% 1
% 3
% 0
%
% Sample Output
% -------------
% 2
% 1
% 0
% =================================================================================================

% Enter your code here. Read input from STDIN. Print output to STDOUT

-module(filter_array).
-export([main/0]).

read_array() ->
    read_array(io:fread("", "~d"), []).
    
read_array({ok, NumRead}, Numbers) ->
    read_array(io:fread("", "~d"), Numbers ++ NumRead);
read_array(_, Numbers) ->
    Numbers.

print_array([]) -> ok;
print_array([H|T]) ->
    io:format("~p~n", [H]),
    print_array(T).

filter(_, [], Arr) -> Arr;
filter(FilterFun, [H|T], Arr) ->
    IsValid = FilterFun(H),
    if
        IsValid -> filter(FilterFun, T, Arr ++ [H]);
        true -> filter(FilterFun, T, Arr)
    end.

filter(FilterFun, ArrToFilter) ->
    filter(FilterFun, ArrToFilter, []).


main() ->
    { ok, [X] } = io:fread("", "~d"),
	Numbers = read_array(),
 %   FilteredNumbers = lists:filter(fun(N) -> N < X end, Numbers),  % Built-in function
    FilteredNumbers = filter(fun(N) -> N < X end, Numbers),
    print_array(FilteredNumbers).
