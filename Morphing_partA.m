function A2a_Gurseerat_2018CSB1093_2020_CS517(input1, input2,prmts1,prmts2,toshow)
I=imread(input1);
J=imread(input2);
[a,b]=size(I);
[aout, bout]=size(J);
if(size(I,3)==3)
     I=rgb2gray(I);
end
if(size(J,3)==3)
     J=rgb2gray(J);
end
 
 p1=prmts1;
 p3=prmts2;
 if(size(I)~=size(J))
     
I=imresize(I,size(J));
 sr=aout/a;
 sc=bout/b;
for k=1:4
    for j=1:2
         i=p3(k,j);
         if(j==1)
             iold=i.*sc;
         end
         if(j==2)
            iold=i.*sr;
         end
        	ifloor=floor(iold);
        	
        	if(ifloor<=0)
            	ifloor=1;
            end
         p3(k,j)=ifloor;
    end 	 
end
 end
 N=uint8(zeros(size(I)));
 [m,n]=size(I);

 x1=p1(1,1);y1=p1(1,2);
 x2=p1(2,1);y2=p1(2,2);
 x3=p1(3,1);y3=p1(3,2);
 x4=p1(4,1);y4=p1(4,2);
 x11=p3(1,1);y11=p3(1,2);
 x22=p3(2,1);y22=p3(2,2);
 x33=p3(3,1);y33=p3(3,2);
 x44=p3(4,1);y44=p3(4,2);
  
 x11y11=x11*y11;
 x22y22=x22*y22;
 x33y33=x33*y33;
 x44y44=x44*y44;
  
 MM=[x11 y11 x11y11 1 0 0 0 0;
    0 0 0 0 x11 y11 x11y11 1;
    x22 y22 x22y22 1 0 0 0 0;
    0 0 0 0 x22 y22 x22y22 1;
    x33 y33 x33y33 1 0 0 0 0;
    0 0 0 0 x33 y33 x33y33 1;
    x44 y44 x44y44 1 0 0 0 0;
    0 0 0 0 x44 y44 x44y44 1 ];
 
 AA=[x1; y1 ;x2 ;y2; x3 ;y3 ;x4; y4];
 D=inv(MM)*AA;
 d1=D(1);d2=D(2);d3=D(3);d4=D(4);d5=D(5);d6=D(6);d7=D(7);d8=D(8);
 

ld=1;
 ImageCell={I};
while(ld>0)
 for i= 1:n
     for j=1:m

          
         p=floor(d1*i+d2*j+d3*i*j+d4);
         q=floor(d5*i+d6*j+d7*i*j+d8);
         if(p<=0)
             p=1;
         end
         if(q<=0)
             q=1;
         end
          if(p>n)
             p=n;
          end
          if(q>m)
             q=m;
          end
         b=floor(q*ld+j*(1-ld));
         a=floor(p*ld+i*(1-ld));
         N(j,i)=J(b,a);
     end
end
   ld=ld-0.005;
   ImageCell = [ImageCell;N];
    end
  
 
    FileName = 'GIF.gif';
   for k = 1:numel(ImageCell)
    
        if k ==1
            imwrite(ImageCell{k},FileName,'gif','LoopCount',Inf,'DelayTime',0.03);
        else
            imwrite(ImageCell{k},FileName,'gif','WriteMode','append','DelayTime',0.03);
        end
    
    end
  if(toshow)
 figure;
 subplot(1,2,1);imshow(I);
 subplot(1,2,2);imshow(J);
 end