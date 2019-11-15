function [R,T,r,t,ampl,z]=stack_te(theta,ni,n,d,nt);

%function [R,T,r,t,ampl,z]=stack_te(theta,ni,n,d,nt);
%
%Reflection and transmission from a stack of
%uniform homogeneous layers for TE-polarization.
%
%theta = incident angle (in radians)
%ni = refractive index of input region
%n = refractive indices of a stack
%d = thickness of a stack (lambda = 1)
%nt = refractive index of output region
%
%R = reflection coefficient
%T = transmission coefficient
%r = complex amplitude of reflected field
%t = complex amplitude of transmitted field
%ampl = amplitude inside the stack
%z = positions of each slabs for ampl
%
%[Moharam et al., ''Stable implementation of the
% rigorous coupled-wave analysis for surface-relief
% gratings: enhanced transmittance matrix approach,''
% J. Opt. Soc. Am A 12, 1077-1086 (1995)]
%
%Pertti Paakkonen (1996)
%Complex refractive index change (1998)
%Field inside stack and proper sign of amplitude (1999)

theta=theta(:);
ni=ni(1);
nt=nt(1);
n=n(:);
d=d(:);
L=length(n);
if (L~=length(d))
  error('vectors n and d must agree!');
end;
kiz=2*pi*ni*cos(theta);
ktz=2*pi*sqrt(nt^2-ni^2*sin(theta)^2);

f=[1;i*ktz/(2*pi)];
for l=L:-1:1
  a=[1,1;gamma(l),-gamma(l)]\f;
  f=[a(1)+a(2)*exp2kgd(l);gamma(l)*(a(1)-a(2)*exp2kgd(l))];
end;

M=[1,-f(1);1,-i*2*pi*f(2)/kiz]\[-1;1];
r=M(1);
t=M(2)*prod(expkgd);
R=abs(r)^2;
T=real(ktz/kiz)*abs(t)^2;

if (nargout>4)
  z=cumsum(d);            
  ampl=zeros(L,1);
  P=[expkgd(L) 1;gamma(L)*expkgd(L) -gamma(L)]\[1;i*ktz/(2*pi)]*t;
  ampl(L)=P(1)*expkgd(L)+P(2);
  for l=L-1:-1:1          
    P=[expkgd(l) 1;gamma(l)*expkgd(l) -gamma(l)]\([1 expkgd(l+1);gamma(l+1) -gamma(l+1)*expkgd(l+1)]*P);
    ampl(l)=P(1)*expkgd(l)+P(2);
  end;                    
end;
