clear all
clc;
x=1;
while x==1,
    x=isempty (input ('Press enter to start program or press zero to quit.  '));
    highE=1318.1505;
    B=987.7669;
    G=783.9911;
    
    D=587.3297;
    A=440;
    lowE=329.6277;
    guitar=[highE,B,G,D,A,lowE];
    if x==1,
        p=input ('Which string are you adjusting? 1=e 2=B 3=G 4=D 5=A 6=E');
        w=guitar (p);
        y=isempty (input ('Press enter to record input signal or 0 to start over.  '));
        while y==1,
            % record input signal
            Fs=44100;
            T=0:1:Fs/2-1;
            
            recorder = audiorecorder(Fs,8,1);
            recordblocking(recorder, 2.5);
            I = getaudiodata(recorder);
        
            % Hear the input signal
            display ('This is how the input signal sounds. ');
            play(recorder);
            pause(2.5);
            %sound (I,Fs);
            % fft of input signal
            J=fft (I)/size(I,1);
            K=0:1:Fs/2-1;
            if p==6
                for i=400:size(J,1)
                    J(i,1)=0;
                end
            else
                for i=1500:size(J,1)
                    J(i,1)=0;
                end
            end
            %Plotting
            subplot(2,1,1);plot(I);
            subplot(2,1,2);plot(K,2*real(J(1:Fs/2)));
            if p==6
                axis([ 200 500 -0.01 0.01])
                for i=400:size(J,1)
                    J(i,1)=0;
                end
                num=K ((find (J==max (J))));
                fprintf('The input fundamental frequency is : %d\n', num');
                if (1.0015*w)>(num)&& (0.9985*w)<(num),
                    display ('Perfect Intonation!!!');
                elseif w>(num),
                    display ('Input frequency should be increased');
                elseif w<(num),
                    display ('Input frequency should be decreased');
                end
                
                
            elseif p==5
                axis([ 400 550 -0.01 0.01])
                for i=550:size(J,1)
                    J(i,1)=0;
                end
                num=K ((find (J==max (J)))+250);
                fprintf('The input fundamental frequency is : %d\n', num');
                if (1.0015*w)>(num-30)&& (0.9985*w)<(num+30),
                    display ('Perfect Intonation!!!');
                elseif w<(num-30),
                    display ('Input frequency should be increased');
                elseif w>(num+30),
                    display ('Input frequency should be decreased');
                end
                
                
            elseif p==4
                axis([ 450 700 -0.01 0.01])
                for i=700:size(J,1)
                    J(i,1)=0;
                end
                num=K ((find (J==max (J)))+336);
                fprintf('The input fundamental frequency is : %d\n', num');
                if (1.0015*w)>(num-30)&& (0.9985*w)<(num+30),
                    display ('Perfect Intonation!!!');
                elseif w>(num+30),
                    display ('Input frequency should be increased');
                elseif w<(num-30),
                    display ('Input frequency should be decreased');
                end
                
                
                
            elseif p==3
                axis([ 650 850 -0.01 0.01])
                for i=900:size(J,1)
                    J(i,1)=0;
                end
                num=K ((find (J==max (J)))+290);
                fprintf('The input fundamental frequency is : %d\n', num');
                if (1.0015*w)>(num-30)&& (0.9985*w)<(num+30),
                    display ('Perfect Intonation!!!');
                elseif w>(num+30),
                    display ('Input frequency should be increased');
                elseif w<(num-30),
                    display ('Input frequency should be decreased');
                end
                
            elseif p==2
                axis([ 800 1100 -0.01 0.01])
                for i=1200:size(J,1)
                    J(i,1)=0;
                end
                num=K ((find (J==max (J)))+730);
                fprintf('The input fundamental frequency is : %d\n', num');
                if (1.0015*w)>(num-30)&& (0.9985*w)<(num+30),
                    display ('Perfect Intonation!!!');
                elseif w>(num-30),
                    display ('Input frequency should be increased');
                elseif w<(num+30),
                    display ('Input frequency should be decreased');
                end
                
                
            elseif p==1
                axis([ 1200 1400 -0.01 0.01])
                for i=1500:size(J,1)
                    J(i,1)=0;
                end
                
                num=K ((find (J==max (J)))+495);
                fprintf('The input fundamental frequency is : %d\n', num');
                if (1.0015*w)>(num-30)&& (0.9985*w)<(num+30),
                    display ('Perfect Intonation!!!');
                elseif w>(num+30),
                    display ('Input frequency should be increased');
                elseif w<(num-30),
                    display ('Input frequency should be decreased');
                end
            end
            
            
            
            % xlabel('Frequency(Hz)'),ylabel('Amplitude(V)');
            % title('input signal');
            %
            % K=0:1:(Fs/2-1);
            %              %(1.0015*w)
            %              num=K (find (J==max (J)));
            %              %(0.9985*w)
            %             if (1.0015*w)>K (find (J==max (J)))&& (0.9985*w)<K (find (J==max (J))),
            %                 display ('Perfect Intonation!!!');
            %                 disp (['The frequency of the input signal is, ', (K (find (J==max (J)))) 'Hz.']);
            %             elseif w>K (find (J==max (J))),
            %                 display ('Input frequency should be increased');
            %             elseif w<K (find (J==max (J))),
            %                 display ('Input frequency should be decreased');
            %             end
            y=isempty (input ('Make needed adjustments and press enter to record a new input signal or 0 to start over. '));
            if y==1,
                continue;
            else x=1;
            end
        end
    end
end

