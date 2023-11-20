function [zigzag_matrix] = zigzag_back(sequence)
%function that creates a matrix of values from the vector using ZIG-ZAG
len = length(sequence);
m = sqrt(len);
n = sqrt(len);
zigzag_matrix = [];
i = 1; %rows
j = 1; %columns

even = 0; %even = 1, odd = 0

%tracks shift on row/column
pomi = 0;
pomj = 0;

number = 0;

    for a = 1:len
        zigzag_matrix(i,j) = sequence(a);
        number = number+1;
        
        if number < (len/2+1) %first half
            if i==1 && j==1 %start
                j = j+1;
                pomi = 1;
            elseif i==1 && pomi == 1
                j = j-1;
                i = i+1;
                pomi = 0;
                even = 1;
            elseif j==1 && pomj == 0 && i>1
                i = i+1;
                pomj = 1;
            elseif j==1 && pomj == 1 && i>1
                i = i-1;
                j = j+1;
                pomj = 0;
                even = 0;
            elseif i==j && i>1
                i = i-1;
                j = j+1;
            elseif i==1 && pomi == 0 && j>1
                j = j+1;
                pomi = 1;
            elseif i>1 && j>1 && i~=j && even == 1
                j = j-1;
                i = i+1;
            elseif i>1 && j>1 && i~=j && even == 0
                j = j+1;
                i = i-1;
            end
        else %second half
            if i==1 && pomi == 0 && j>1
                i = i+1;
                pomj = 1;
            elseif j==n && pomj == 1 && i>1
                i = i+1;
                j = j-1;
                pomj = 0;
                even = 1;
            elseif j==n && pomj == 0 && i>1
                i = i+1;
                pomj = 1;
            elseif i==m && pomi == 0 && j>1
                j = j+1;
                pomi = 1;
            elseif i==m && pomi == 0 && j==1
                j = j+1;
                pomi = 1;
            elseif i==m && pomi == 1 && j>1
                i = i-1;
                j = j+1;
                pomi = 0;
                even = 0;
            elseif i>1 && j>1 && i~=j && even == 0
                j = j+1;
                i = i-1;
            elseif i>1 && j>1 && i~=j && even == 1
                j = j-1;
                i = i+1;
            elseif i==j && i>1
                i = i-1;
                j = j+1;
            end
        end
    end