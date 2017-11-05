%define x and y pos of turtles
clear;
N=500;%number of turtles
d=0.5;%distance a turtle moves in 1 time step
steps=1000;
R=33;
exitflag = false;
exitflag2=false;

for i=1:N
    x(i)=0;%xpos of turtles
    y(i)=0;%ypos of turtles
    distance(i)=0;%distance of turtles
end

for j=1:steps
    for k=1:N
        p=rand();%random number BETWEEN 0 and 1
        if distance(k)<R
            if p<0.25
                x(k)=x(k)+d;
                currentDirX(k)=d;
            elseif (p>=0.25 && p<0.5)
                x(k)=x(k)-d;
                currentDirX(k)=-d;
            elseif (p>=0.5 && p<0.75)
                y(k)=y(k)+d;
                currentDirY(k)=d;
            elseif (p>=0.75 && p<1)
                y(k)=y(k)-d;
                currentDirY(k)=-d;
            end
        else
            exitflag=true;
            if ~exitflag2
                exitstep=j;
                exitflag2=true;
            end
            x(k)=x(k)+currentDirX(k);
            y(k)=y(k)+currentDirY(k);
        end
        
        distance(k) = sqrt(x(k)^2+y(k)^2);
        
    end
    
    average_d(j) = sum(distance)/N;
    
    subplot(1,2,1)
    hold off
    drawCircle(0,0,R);
    hold on
    scatter(x,y,'.','black');
    title('photons escaping the sun ')
    
    subplot(1,2,2)
    hold off
    plot(average_d)
    title('average d')
    hold on
    if exitflag
        plot([exitstep exitstep],[-999 999]);
    end
    axis([0,steps,0,30])
    pause(0.05);
    
    
    
end

