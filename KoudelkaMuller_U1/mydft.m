function [R_output1, R_output2] = mydft(R_input)

    j = sqrt(-1);

    for u = 0:7
        for v = 0:7           
            suma = 0;
            for x = 0:7
                for y = 0:7
                    
                    add = R_input(x+1,y+1)*exp(-j*2*pi*(u*x+v*y)/8);
                    suma = suma + add;
                    
                end
            end    
            Fuv = suma;
            Magnitude = sqrt(real(Fuv)^2+imag(Fuv)^2);
            Phase = atan2(imag(Fuv),real(Fuv));
            R_output1(u+1,v+1) = Magnitude;
            R_output2(u+1,v+1) = Phase;
        end
    end
   
end