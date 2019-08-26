% =================================================================================================
% Given a list, repeat each element in the list n amount of times.
%
% Input Format
% ------------
% The first line contains the integer S where S is the number of times you need to repeat the
% elements. The next X lines each contain an integer. These are the X elements in the array.
%
% Output Format
% -------------
% Output each element of the original list S times, each on a separate line. You have to return
% the list/vector/array of S*X integers. The relative positions of the values should be the same
% as the original list provided in the input.
%
% Constraints
% -----------
% 0 <= X <= 10
% 1 <= S <= 100
%
% Sample Input
% ------------
% 3
% 1
% 2
% 3
% 4
%
% Sample Output
% -------------
% 1
% 1
% 1
% 2
% 2
% 2
% 3
% 3
% 3
% 4
% 4
% 4
% =================================================================================================

% Enter your code here. Read input from STDIN. Print output to STDOUT

-module(list_replication).
-export([main/0]).

read_array() ->
    read_array(io:fread("", "~d"), []).
    
read_array({ok, NUMARR}, ACC) ->
    read_array(io:fread("", "~d"), ACC ++ NUMARR);
read_array(_, ACC) ->
    ACC.
    
print([], _) -> ok;
print([H|T], N) ->
    print_n_times([H], N),
    print(T, N).
    
print_n_times(_, 0) -> ok;
print_n_times(PN, N) ->
    io:format("~p~n", PN),
    print_n_times(PN, N - 1).

main() ->
    {ok, [N]} = io:fread("", "~d"),
    ACC = read_array(),
    print(ACC, N).
