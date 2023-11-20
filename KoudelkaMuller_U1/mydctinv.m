function [R_output] = mydctinv(R_input)


    for x = 0:7
        for y = 0:7
           
            suma = 0;

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

                    add = Cu*Cv*R_input(u+1,v+1)*cos(((2*x + 1)*u*pi)/16)*cos(((2*y + 1)*v*pi)/16);
                    suma = suma + add;
                end
            end    
            Fuv = (1/4)*suma;
            R_output(x+1,y+1) = Fuv;
        end
    end

end