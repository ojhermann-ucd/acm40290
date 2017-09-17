function [ the_answer ] = na_1a( the_end )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
syms k;
the_answer = symsum(sum_element(odd_number(k)), k, 0, Inf);

end

