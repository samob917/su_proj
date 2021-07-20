function [output] = possibilities(vM,w)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

forbid=zeros(1,81);
for i=1:3
    for j=1:3
        for k=1:3
            for ell=1:3
                if vM((i-1)*3^3+(j-1)*3^2+(k-1)*3+ell)==w
                    ip=i;
                    jp=j;
                    kp=k;
                    ellp=ell;
                end
                if vM((i-1)*3^3+(j-1)*3^2+(k-1)*3+ell)>0
                    forbid((i-1)*3^3+(j-1)*3^2+(k-1)*3+ell)=-1;
                end
            end
        end
    end
end
for i=1:3
    for j=1:3
        forbid( (i-1)*3^3+(j-1)*3^2+(kp-1)*3+ellp )=-1;
    end
end
for i=1:3
    for k=1:3
        forbid( (i-1)*3^3+(jp-1)*3^2+(k-1)*3+ellp )=-1;
    end
end
for i=1:3
    for ell=1:3
        forbid( (i-1)*3^3+(jp-1)*3^2+(kp-1)*3+ell )=-1;
    end
end
for j=1:3
    for k=1:3
        forbid( (ip-1)*3^3+(j-1)*3^2+(k-1)*3+ellp )=-1;
    end
end
for j=1:3
    for ell=1:3
        forbid( (ip-1)*3^3+(j-1)*3^2+(kp-1)*3+ell )=-1;
    end
end
for k=1:3
    for ell=1:3
        forbid( (ip-1)*3^3+(jp-1)*3^2+(k-1)*3+ell )=-1;
    end
end
forbid( (ip-1)*3^3+(jp-1)*3^2+(kp-1)*3+ellp )=0;

prelist=[];
for i=1:3
    for j=1:3
        temp=[];
        for k=1:3
            for ell=1:3
                m=(i-1)*3^3+(j-1)*3^2+(k-1)*3+ell;
                if forbid(m)~=-1
                    temp=[temp; m];
                end
            end
        end
        [c,~]=size(prelist);
        [d,~]=size(temp);
        if (i==1)&&(j==1)
            c=1;
        end
        prelist=[ kron(temp,ones(c,1)) kron(ones(d,1),prelist)];
    end
end

table=zeros(81,4);
for i=1:3
    for j=1:3
        for k=1:3
            for ell=1:3
                table((i-1)*3^3+(j-1)*3^2+(k-1)*3+ell,:)=[i j k ell];
            end
        end
    end
end

output=[];
[n,~]=size(prelist);
for q=1:n   
    good=1;
    play=zeros(9,4);
    for r=1:9
        play(r,:)=table(prelist(q,r),:);
    end
    for r=1:9
        for s=(r+1):9
            for t=1:4
                for u=(t+1):4
                    if (play(r,t)==play(s,t))&&(play(r,u)==play(s,u))
                        good=0;
                    end
                end
            end
        end
    end
    if good==1
        vMtemp=vM;
        for z=1:9
            vMtemp(prelist(q,z))=w;
        end
        output=[output; vMtemp];
    end
end
    
    

end

