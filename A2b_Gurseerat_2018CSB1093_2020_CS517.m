function A2b_Gurseerat_2018CSB1093_2020_CS517(input1, input2,prmts1,prmts2,toshow)

I=imread(input2);
J=imread(input1);

if(size(I,3)==3)
     I=rgb2gray(I);
end
if(size(J,3)==3)
     J=rgb2gray(J);
end
 [aI,bI]=size(I);
 [aJ,bJ]=size(J);
 if(aI*bI<aJ*bJ)
    J=imresize(J,size(I));
    [aout,bout]=size(J);
    N=uint8(zeros(size(J)));
 else
    I=imresize(I,size(J));
    [aout,bout]=size(I);
    N=uint8(zeros(size(I)));
 end    
    
  figure;
  dt = delaunayTriangulation(prmts1(:,1),-prmts1(:,2));
  subplot(2,2,1);
  triplot(dt);
  dt.Points(:,2)=dt.Points(:,2).*(-1);
 
  dt2 = delaunayTriangulation(prmts2(:,1),-prmts2(:,2));
  subplot(2,2,2);
  triplot(dt2);
  dt2.Points(:,2)=dt2.Points(:,2).*(-1);

  
 ImageCell={J};
 [s1,~]=size(dt.ConnectivityList());
 total_triangles=s1;
  ld=0;
while(ld<=1)
  disp(ld);
  lambda=ld;
  prmts3=(prmts1.*ld+prmts2.*(1-ld));
  
  dt3 = delaunayTriangulation(prmts3(:,1),-prmts3(:,2));
  subplot(2,2,3);
  triplot(dt3);
  dt3.Points(:,2)=dt3.Points(:,2).*(-1);
  
  triangle_no=1;
   while(triangle_no<total_triangles+1)
  tr1=dt.ConnectivityList(triangle_no,:);
  tie1=[ prmts1(tr1(1),:);prmts1(tr1(2),:) ; prmts1(tr1(3),:) ];
  tie2=[ prmts2(tr1(1),:);prmts2(tr1(2),:) ; prmts2(tr1(3),:) ];
  tie3=[ prmts3(tr1(1),:);prmts3(tr1(2),:) ; prmts3(tr1(3),:) ];
  
  x1=tie1(1,1);y1=tie1(1,2);
  x2=tie1(2,1);y2=tie1(2,2);
  x3=tie1(3,1);y3=tie1(3,2);
  
  x01=tie2(1,1);y01=tie2(1,2);
  x02=tie2(2,1);y02=tie2(2,2);
  x03=tie2(3,1);y03=tie2(3,2);
  
  x11=tie3(1,1);y11=tie3(1,2);
  x22=tie3(2,1);y22=tie3(2,2);
  x33=tie3(3,1);y33=tie3(3,2);
   
 Matrix=[ x11  y11  1   0   0   0 ;
           0  0   0   x11 y11  1 ;
          x22  y22  1   0   0   0 ;  
           0  0   0   x22 y22  1 ;
          x33  y33  1   0   0   0 ;
           0  0   0   x33 y33  1 ;];
 
 A1=[x1; y1 ;x2 ;y2; x3 ;y3];
 D1=inv(Matrix)*A1;
 d1=D1(1);d2=D1(2);d3=D1(3);d4=D1(4);d5=D1(5);d6=D1(6);
 A2=[x01; y01 ;x02 ;y02; x03 ;y03];
 D2=inv(Matrix)*A2;
 d01=D2(1);d02=D2(2);d03=D2(3);d04=D2(4);d05=D2(5);d06=D2(6);
 

 n=floor(max(tie3));
 m=floor(min(tie3));
X1 = tie3(:,1);
Y1 = tie3(:,2);
triangle = polyshape({X1},{Y1});
disp(triangle_no);
 for i= m(1):n(1)
     for j=m(2):n(2)
        if( isinterior(triangle,i,j)==1)
              p=floor(d1*i+d2*j+d3);
              q=floor(d4*i+d5*j+d6);
              p0=floor(d01*i+d02*j+d03);
              q0=floor(d04*i+d05*j+d06);
           if(p<=0)
               p=1;
           end
           if(q<=0)
               q=1;
           end
            if(p0<=0)
               p0=1;
           end
           if(q0<=0)
               q0=1;
           end
           if(p>bout)
               p=bout;
           end
           if(q>=aout)
               q=aout;
           end
           if(p0>bout)
               p0=bout;
           end
           if(q0>=aout)
               q0=aout;
           end
           
             N(j,i)=(lambda)*I(q,p)+(1-lambda)*J(q0,p0);
     
        end
     end
 end
 triangle_no=triangle_no+1;
   end
     ld=ld+0.1;
    ImageCell = [ImageCell;N];
    
   end
 
FileName = 'GIF.gif';
   for k = 1:numel(ImageCell)
    
        if k ==1
            imwrite(ImageCell{k},FileName,'gif','LoopCount',Inf,'DelayTime',0.3);
        else
            imwrite(ImageCell{k},FileName,'gif','WriteMode','append','DelayTime',0.3);
        end
    
   end
    if(toshow==1)
 figure;imshow(N);
    end