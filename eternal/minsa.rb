require_relative'six'                     'el';eval(%W`include~
Math;puts"Usage:~ruby                     ~#{__FILE__}~[line_he
ight]~[width]~[seed]"                     ;line_height=ARGV.fir
st&.to_i||14;width=AR                     GV[1]&.to_i||400;seed
=ARGV[2]&.to_i||rand(                     100000);p(seed:);sran
d~seed;$maxw=240;$mpa                     t=[[1,1,0],[2,2,1],[1
,3,1]][rand**5*3];ab=                     [0,1].map{s=4*rand(2+
$mpat[2]..4);r=l=[2*r                     and(2),s,2*s].sample;
l,r=[l,4*s].shuffle~i                     f~rand<0.2;[l+r+3*s,l
,s,r,_1]};if(sum=ab.s                     um{_1[0]})<200*rand;i
=rand($maxw          -sum);l=rand($maxw-su          m-i);ab[1][
0]=l+ab[0            ][0]+i;ab[0][0]=l;els            e~ab.pop;
ab[0][0    ]=rand($ma                     xw-ab[0][0    ])end;$
minsa    =ab;def~noiz                     e(x)sin(x)+s    in(1.
   3*x)              +sin(1.7*x)end;A,B,C,              D=4.   
 time                s.map{rand*100};E=1+r                and( 
2);                  $string_color=$maxw.t                  ime
s.m                  ap~do|ix|noize(0.05*i                  x+A
 )>1?                4:noize(0.1*ix+B)>1?5                :noi 
   ze(0              .2*ix+C)>0?6+ix/E%2:n              oize   
     (0.2            *ix+D)>0?3*(1+sin(ix*            0.1+     
       C))/          2:4+rand(4)end;def~co          lor_       
         at(x        ,y)x-=10;x+=0.05*(sin        (x-y         
           )+si      n(2.7*x+y))+2*(sin(0.      013*           
             y)+s    in(0.007*y));y+=2*(si    n(0.             
               011*  x+0.012*y)+sin(0.013*  x-0.               
                 017*y))+(noize(x/2+y/15)+noiz                 
                   e(  x/3-y/13))/12;y+=  no                   
ize(y/2.5)*(0.2+noize(0.0             2*x+y/5)*0.1);y2=y+sin(y)
;y3=y2+sin(y2);ci=((4  *x+y         3-PI  )/4/PI);cj=((-4*x+y3-
PI)/4/PI);i=ci.floor;    ci-=     i;j=    cj.floor;cj-=j;ck=(ci
+cj)/2;ix=i-j;color_i      ndex =$st      ring_color[ix];$minsa
.each~do|x,l,s,r,idx|        if~x<        =ix&&ix<x+l+3*s+r;xx=
ix-x-l;pattern=->(y){          y          y=y-10*s*idx;0<=xx&&x
x<3*s&&(yy%(10*s)<6*s                     )&&(yy%(30*s)<6*s~?(s
..3*s/2).cover?([(y=y                     y%(6*s)-3*s).abs/1.5+
(xx-s*3/2).abs,-0.8*y                     +s/2].max):((yy/s/2).
floor%2+xx/s%2)%2==1)                     };offset=31*sin(31*ix
)%1*3;color_index=ix/                     $mpat[0]%$mpat[1]<$mp
at[2]?3:12.times.coun                     t{!pattern[y+_1*0.5+o
ffset]}/4.0;break;end                     ;end;brightness=(ci*(
1-ci)*cj*(1-cj)*3+0.4                     )*((4*ck*(1.0-ck))**3



                     6*0.5+0.5)*(0.9+0.1*s                     
                     in((3+sin(ix))*(ci-cj                     
                     )+ix+y/4).abs+0.1*sin                     
                     ((5+cos(ix))*(ci-cj)+                     
                     7*ix+y/4).abs);if~ix<                     
                     0||ix>=$maxw;a=((y3-P                     
                     I)/4%PI-PI/2).abs-PI/                     
                     2;z=y-(x<1?0:2*PI);b=                     
                     sin((z/(PI*4)).floor)                     
                     *123%1+2;v=((z%(PI*4)                     
           -2*PI)**2+                     b*[x,($max           
         w-1)*PI/2-x]                     .min**2)/4/P         
       I/PI          ;return~color(4,v<1?(          1-v)       
     *(0.            8+0.2*sin(11*v**0.5).            abs)     
*(0    .7+0.3*atan([a                     -x,x-$maxw*PI/    2-a
]    .max)*2/PI):0)en                     d;brightness*=1+    (
   noize(0.004*x+0.01                     7*y)+noize(0.007*x   
   -0.006*y))/9;color                     (color_index,brigh   
t    ness)end;def~col                     or(idx,brightnes    s
)(i    dx+rand).floor                     *32+(31*bright    nes
s+ran    d).floor.cla                     mp(0,31)end;    color
s=[[1,1    ,1],[0.8,0                     .8,1],[0.6    ,0.6,1]
,[0.4,0.4    ,1],*[[0                     .5,0.7,1    ],[0.6,1,
1],[0.7,0.8    ,1],[0                     .8,1,0    .4]].shuffl
e];colors.map    !{|a                     |a.s    ort.reverse}i
f~rand<0.5;tabl    e=                     co    lors.flat_map~d
o|r,g,b|32.times.                             map~do|i|cr,cg,cb
=[r,g,b].map{(255*_  1*                 i/  31+(i**3)/512).clam
                         p(0,255).roun                         
                     d}    ;cr<<16|c    g<                     
                     <8|c    b;end    ;end                     
                     ;trap(    '    INT'){                     
                     exit};y=     0;loop~d                     
                     o~sleep~0. 1;lines=li                     
                     ne_height.times.map~d                     
                     o~y+=1;width.times.ma                     
                     p{|x|color_at(x*400.0                     
                     /width,y*400.0/width)                     
                     }end;print~Sixel.buil                     
                     d~lines,table;end.for                     
                     RubyKaigi2024@Okinawa                     
                     `.join.tr(?~,32.chr))