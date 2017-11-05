function drawCircle(x,y,r)

ang=0:0.01:2*pi; 
xp=r*cos(ang);
yp=r*sin(ang);
plot(x+xp,y+yp,'y','LineWidth',5);
axis equal
axis([-50 50 -50 50])

end