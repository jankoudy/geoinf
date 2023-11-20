function [R_output] = mydct(R_input)
    

    for u = 0:7
        for v = 0:7
            if u==0
                Cu = sqrt(2)/2;
            else 
                Cu = 1;
            end

            if v==0
                Cv = sqrt(2)/2;
            else 
                Cv = 1;
            end
            
            suma = 0;
            for x = 0:7
                for y = 0:7
                    add = R_input(x+1,y+1)*cos(((2*x + 1)*u*pi)/16)*cos(((2*y + 1)*v*pi)/16);
                    suma = suma + add;
                end
            end    
            Fuv = (1/4)*Cu*Cv*suma;
            R_output(u+1,v+1) = Fuv;
        end
    end

end