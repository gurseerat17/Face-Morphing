I=imread('dadi.jpeg');
J=imread('me.jpeg');

if(size(I,3)==3)
     I=rgb2gray(I);
end
if(size(J,3)==3)
     J=rgb2gray(J);
end
J=imresize(J,[512 512]);
I=imresize(I,size(J));
figure;
imshow(J);
% imshow(J);
prmts2=[171 208 ;%eyebrowLL
        191 189; %eyebrow lt
        246 184;% eyebrow lr
        216 210;%eye ll
        218 219;%eye lt
       221 220;%eye lb
      245 213;%eye lr
       318 168;%eyebrow rl
       363 165;%eyebrow rt
      375 172;%eyebrow rr
      325 205;%eye rl
      343 195;%eye rt
      347 204;%eye rb
      367 202;%eye rr
      289 204;%nose top
      308 258;%nose mid
      327 270;%nostril r
      284 276;%nostril l
      252 318; %lip l
      307 306;%lip t
      311 335;%lip b
      342 303;%lip r
      166 339;%jaw l
      317 373;%chin
      385 311;%jaw r
%      132 117;%ear rb
 %     138 80; %ear rt
      97 224 ;%ear lt
      131 309;%ear rb
      512 512; %c4
      1 512;%c3
      512 1;%c2
      1 1 ;%c1
      201 270;%cheek l
      375 250;%cheek r
      276 123;%forehead
     351 98;%hair r
      118 122;%hair l
      243 53;%hair top
      ];
  
  prmts1=[171 211 ;%eyebrowLL
        193 203; %eyebrow lt
        256 209;% eyebrow lr
        191 235;%eye ll
        216 227;%eye lt
       219 242;%eye lb
       243 237;%eye lr
      315 209;%eyebrow rl
      367 206;%eyebrow rt
      378 212;%eyebrow rr
      314 240;%eye rl
     339 229;%eye rt
      341 246;%eye rb
      360 237;%eye rr
      287 229;%nose top
      295 292;%nose mid
      310 306;%nostril r
      265 305;%nostril l
      232 327; %lip l
      284 327;%lip t
      286 352;%lip b
      320 328;%lip r
      365 331;%jaw l
      325 404;%chin
      163 336;%jaw r
%      132 117;%ear rb
 %     138 80; %ear rt
      93 205 ;%ear lt
      135 286;%ear rb
      512 512; %c4
      1 512;%c3
      512 1;%c2
      1 1 ;%c1
      211 286;%cheek l
      360 280;%cheek r
      288 158;%forehead
      373 125;%hair r
      262 43;%hair l
      138 106;%hair top
      ];