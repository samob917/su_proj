relationships = [];
for m = 1:104
    M = Array(:,:,m);
    group = [];
    x = perms(1:4);
    
    for i = 1:24
        new = x(i,:);
        C = invert(M,new);
        C = standardize(C);
        for j = 1:104
            if C == Array(:,:,j)
                group = [group j]
            end
        end
        %relationships(:,m) = group
        
    end
    relationships(:,:,m) = group
    
    
    
    
end
orbits= []
unique_relationships = []
for a = 1:104
        z = unique(relationships(:,:,a))
        
        sam = size(z)
        orbits(:,:,a) = sam(2)
        %orbits = [orbits; a sam(2)]
        
        
end