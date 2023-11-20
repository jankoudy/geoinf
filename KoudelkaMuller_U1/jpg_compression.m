function [output] = jpg_compression(image, q, trans, res, zig, huf)
    
    
    if ~exist('trans','var')
        trans = 'dct';
    end

    if ~exist('res','var')
        res = '1x1';
    end
    
    if ~exist('zig','var')
        zig = false();
    end

    if ~exist('huf','var')
        huf = false();
    end

    fig1 = imread(image);


    imtool(fig1);
    
    K_original = fig1;
    K_trans = fig1;
    
    size_image = size(fig1);

    if size(fig1,3) == 1
        R = double(fig1(:,:));
        G = double(fig1(:,:));
        B = double(fig1(:,:));
    else
        R = double(fig1(:,:,1));
        G = double(fig1(:,:,2));
        B = double(fig1(:,:,3));
    end

    Y = 0.2990*R + 0.5870*G + 0.1140*B ;
    CB = -0.1687*R - 0.3313*G + 0.5000*B + 128;
    CR = 0.5000*R - 0.4187*G - 0.0813*B + 128;
    
   
    
    Qy =   [16 11 10 16 24 40 51 61
            12 12 14 19 26 58 60 55
            14 13 16 24 40 87 69 56
            14 17 22 29 51 87 80 62
            18 22 37 26 68 109 103 77
            24 35 55 64 81 104 113 92
            49 64 78 87 103 121 120 101
            72 92 95 98 112 100 103 99];
    
    Qc =   [17 18 24 47 66 99 99 99
            18 21 26 66 99 99 99 99
            24 26 56 99 99 99 99 99
            47 69 99 99 99 99 99 99
            99 99 99 99 99 99 99 99
            99 99 99 99 99 99 99 99
            99 99 99 99 99 99 99 99
            99 99 99 99 99 99 99 99];
    
    
   
    
    row = 1;
    for i = 1:8:(size_image(1)-7)
        column = 1;
        for j = 1:8:(size_image(2)-7)
    
            YT = Y(i:i+7,j:j+7);
            CBT = CB(i:i+7,j:j+7);
            CRT = CR(i:i+7,j:j+7);
    
            YR = resampling(YT, res);
            CBR = resampling(CBT, res);
            CRR = resampling(CRT, res);
            
            if trans == 'dct'
    
                YTDC = mydct(YR);
                CBTDC = mydct(CBR);
                CRTDC = mydct(CRR);

                QYY = 50*Qy/q;
                QCC = 50*Qc/q;
        
                YTQ = round(YTDC./QYY);
                CBTQ = round(CBTDC./QCC);
                CRTQ = round(CRTDC./QCC);
                
                if zig == true()
                                   
                    YZZ = zigzag(YTQ);
                    CBZZ = zigzag(CBTQ);
                    CRZZ = zigzag(CRTQ);

                    YTZ{row, column} = YZZ;
                    CBTZ{row, column} = CBZZ;
                    CRTZ{row, column} = CRZZ;

                    
                elseif zig == false()

                    YTT(i:i+7,j:j+7) = YTQ;
                    CBTT(i:i+7,j:j+7) = CBTQ;
                    CRTT(i:i+7,j:j+7) = CRTQ;
                end

            elseif trans == 'dft'
    
                [YTDC1, YTDC2] = mydft(YR);
                [CBTDC1, CBTDC2] = mydft(CBR);
                [CRTDC1, CRTDC2] = mydft(CRR);

                QYY = 50*Qy/q;
                QCC = 50*Qc/q;

                YTQ1 = round(YTDC1./QYY);
                CBTQ1 = round(CBTDC1./QCC);
                CRTQ1 = round(CRTDC1./QCC);

                YTQ2 = round(YTDC2./QYY);
                CBTQ2 = round(CBTDC2./QCC);
                CRTQ2 = round(CRTDC2./QCC);
                
                if zig == true()

                    YZZ1 = zigzag(YTQ1);
                    CBZZ1 = zigzag(CBTQ1);
                    CRZZ1 = zigzag(CRTQ1);

                    YZZ2 = zigzag(YTQ2);
                    CBZZ2 = zigzag(CBTQ2);
                    CRZZ2 = zigzag(CRTQ2);

                    YTZ1{row, column} = YZZ1;
                    CBTZ1{row, column} = CBZZ1;
                    CRTZ1{row, column} = CRZZ1;

                    YTZ2{row, column} = YZZ2;
                    CBTZ2{row, column} = CBZZ2;
                    CRTZ2{row, column} = CRZZ2;
                
                elseif zig == false()

                    YTT1(i:i+7,j:j+7) = YTQ1;
                    CBTT1(i:i+7,j:j+7) = CBTQ1;
                    CRTT1(i:i+7,j:j+7) = CRTQ1;
    
                    YTT2(i:i+7,j:j+7) = YTQ2;
                    CBTT2(i:i+7,j:j+7) = CBTQ2;
                    CRTT2(i:i+7,j:j+7) = CRTQ2;

                end
            end
    
        column = column + 1;   
        end
    row = row + 1;
    end
    
    row = 1;
    for i = 1:8:(size_image(1)-7)
        column = 1;
        for j = 1:8:(size_image(2)-7)
                
            if trans == 'dct'
                              
                if zig == true()

                    YTTZ = YTZ{row, column};
                    CBTTZ = CBTZ{row, column};
                    CRTTZ = CRTZ{row, column};
                
                    YTTT = zigzag_back(YTTZ);
                    CBTTT = zigzag_back(CBTTZ);
                    CRTTT = zigzag_back(CRTTZ);
                
                elseif zig == false()

                    YTTT = YTT(i:i+7,j:j+7);
                    CBTTT = CBTT(i:i+7,j:j+7);
                    CRTTT = CRTT(i:i+7,j:j+7);
                end

                

                QYY = 50*Qy/q;
                QCC = 50*Qc/q;
        
                YTTQ = round(YTTT.*QYY);
                CBTTQ = round(CBTTT.*QCC);
                CRTTQ = round(CRTTT.*QCC);
    
                YTD = mydctinv(YTTQ);
                CBTD = mydctinv(CBTTQ);
                CRTD = mydctinv(CRTTQ);
    
            elseif trans == 'dft'
                
                if zig == true()

                    YTTZ1 = YTZ1{row, column};
                    CBTTZ1 = CBTZ1{row, column};
                    CRTTZ1 = CRTZ1{row, column};

                    YTTZ2 = YTZ2{row, column};
                    CBTTZ2 = CBTZ2{row, column};
                    CRTTZ2 = CRTZ2{row, column};
                
                    YTTT1 = zigzag_back(YTTZ1);
                    CBTTT1 = zigzag_back(CBTTZ1);
                    CRTTT1 = zigzag_back(CRTTZ1);
                
                    YTTT2 = zigzag_back(YTTZ2);
                    CBTTT2 = zigzag_back(CBTTZ2);
                    CRTTT2 = zigzag_back(CRTTZ2);
                
                elseif zig == false()

                    YTTT1 = YTT1(i:i+7,j:j+7);
                    CBTTT1 = CBTT1(i:i+7,j:j+7);
                    CRTTT1 = CRTT1(i:i+7,j:j+7);
    
                    YTTT2 = YTT2(i:i+7,j:j+7);
                    CBTTT2 = CBTT2(i:i+7,j:j+7);
                    CRTTT2 = CRTT2(i:i+7,j:j+7);
                end

                QYY = 50*Qy/q;
                QCC = 50*Qc/q;

                YTTQ1 = round(YTTT1.*QYY);
                CBTTQ1 = round(CBTTT1.*QCC);
                CRTTQ1 = round(CRTTT1.*QCC);

                YTTQ2 = round(YTTT2.*QYY);
                CBTTQ2 = round(CBTTT2.*QCC);
                CRTTQ2 = round(CRTTT2.*QCC);
    
                YTD = mydftinv(YTTQ1, YTTQ2);
                CBTD = mydftinv(CBTTQ1, CBTTQ2);
                CRTD = mydftinv(CRTTQ1, CRTTQ2);
            
            end
    
            YTF(i:i+7,j:j+7) = round(YTD);
            CBTF(i:i+7,j:j+7) = round(CBTD);
            CRTF(i:i+7,j:j+7) = round(CRTD);   
        column = column + 1;
        end
    row = row + 1; 
    end
    

    %imshow(CRTF)
    
    RI = 1.0091*YTF -0.0032*(CBTF-128) + 1.3955*(CRTF-128);
    GI = 1.0091*YTF -0.3472*(CBTF-128) - 0.7206*(CRTF-128);
    BI = 1.0091*YTF +1.7689*(CBTF-128) - 0.0066*(CRTF-128);
    
    
    fig2(:,:,1) = uint8(RI);
    fig2(:,:,2) = uint8(GI);
    fig2(:,:,3) = uint8(BI);
    
    imtool(fig2);
    
    output = fig2;

    dR = RI - R;
    dG = GI - G;
    dB = BI - B;
    
    qvR = dR.*dR;
    qvG = dG.*dG;
    qvB = dB.*dB;
    
    sumR = sum(sum(qvR));
    sumG = sum(sum(qvG));
    sumB = sum(sum(qvB));
    
    mR = sqrt(sumR/(size_image(1)*size_image(2)));
    mG = sqrt(sumG/(size_image(1)*size_image(2)));
    mB = sqrt(sumB/(size_image(1)*size_image(2)));
    
    disp('mR = ')
    disp(mR)
    disp('mG = ')
    disp(mG)
    disp('mB = ')
    disp(mB)

    compression_factor_text = int2str(q);
    image_text = append('_trans_', compression_factor_text, '.');
    image_transform_text = replace(image,'.',image_text);
    imwrite(output, image_transform_text);
    
    
    text = append(extractBefore(image_transform_text,'.'), '.txt');

    
    FID = fopen(text,'w');
    


    fprintf(FID, 'mR = %.10f\nmG = %.10f\nmB = %.10f\n', mR, mG, mB);

    fclose(FID);

end