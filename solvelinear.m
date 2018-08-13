function x=solvelinear(A,b)
[n,m]=size(A);
if n~=m
    disp('error')
    return
end
A=[A,b];
x=zeros(n,1);
for i=1:n
    [r,m]=max(abs(A(i,1)));
    if m~=1
        A([1 m],:)=A([m 1],:);
    end
    if abs(A(1,1)==0)
        disp('A is singular');
        return
    end
end
for j=1:n+1
    A(1,j)=A(1,j)/A(1,1);
end
for k=2:n-1
    for i=k:n
        for r=1:k-1
            A(i,k)=A(i,k)-A(i,r)*A(r,k);
        end
        [r,m]=max(abs(A(i,k)));
        if m~=k
            A([k m],:)=A([m k],:);
        end
        if abs(A(m,k))==0
            disp('A is singular')
            return
        end
    end
    for j=k+1:n+1
        for r=1:k-1
        A(k,j)=(A(k,j)-A(k,r)*A(r,j))/A(k,k);
        end
    end
end
for r=1:n-1
    A(n,n)=A(n,n)-A(n,r)*A(r,n);
end
if A(n,n)==0
    disp('A is singular')
end
x(n)=A(n,n+1);
for k=n-1:-1:1
    for r=k+1:n
        x(k)=A(k,n+1)-A(k,r)*x(r);
    end
end
end