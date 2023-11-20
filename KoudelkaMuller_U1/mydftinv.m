function [R_output] = mydftinv(R_input1, R_input2)

    j = sqrt(-1);
    
    for x = 0:7
        for y = 0:7   
            suma = 0;
            for u = 0:7
                for v = 0:7
                    input1 = R_input1(u+1,v+1)*cos(R_input2(u+1,v+1));
                    input2 = R_input1(u+1,v+1)*sin(R_input2(u+1,v+1));
                    input = input1 + j*input2;
                    add = input*exp(j*2*pi*(u*x+v*y)/8);
                    suma = suma + real(add);
                end
            end    
            Fuv = (1/64)*suma;
            R_output(x+1,y+1) = Fuv;
        end
    end

end