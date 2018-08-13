function [L,U,P]=ludecomposition2(A)
[m,n]=size(A);
if (m~=n)
    disp('error');
end
p=(1:n)';
for k=1:n-1; %kth column
    [r,m]=max(abs(A(k:n,k)));
    m=m+k-1;
    if (A(m,k)~=0)
        if (m~=k)
            A([m k],:)=A([k m],:);
            p([m k])=p([k,m]);
        end
        for i=k+1:n
            A(i,k)=A(i,k)/A(k,k);
            for j=k+1:n
                A(i,j)=A(i,j)-A(i,k)*A(k,j);
            end
        end
    end
end
end