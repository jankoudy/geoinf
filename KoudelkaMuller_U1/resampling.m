function [R_output] = resampling(R_input, size)
    
    if size == '2x1'
        m = 1;
        n = 2;
    elseif size == '1x2'
        m = 2;
        n = 1;
    elseif size == '2x2'
        m = 2;
        n = 2;
    elseif size == '4x4'
        m = 4;
        n = 4;
    elseif size == '1x1'
        m = 1;
        n = 1;
    else
        disp('Špatná velikost resamplování')
    end

    for i = 1:m:8
        for j = 1:n:8
            average = 0;
            number = 0;
            for x = 0:(m-1)
                for y = 0:(n-1)
                    average = average + R_input(i+x,j+y);
                    number = number + 1;
                end
            end
            average = average/number;
            for x = 0:(m-1)
                for y = 0:(n-1)
                    R_output(i+x,j+y) = average;
                end
            end
        end
    end
    