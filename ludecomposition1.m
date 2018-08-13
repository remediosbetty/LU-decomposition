function [L, U]=ludecomposition1(A)
[n,m]=size(A);
if m~=n
    disp('error,A is not symmatric')
end
U=zeros(n);
L=eye(n);
for i=1:n-1
    for j=i+1:n
        L(j,i)=A(j,i)/A(i,i);
        A(j,:)=A(j,:)-(A(j,i)/A(i,i))*A(i,:);
    end
end
U=A;
end