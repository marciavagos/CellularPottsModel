function boundary = draw_boundary(lattice)
% cells = draw_boundary(lattice)
% Draw spins with boundaries

boundary=zeros(size(lattice));
for i=1:size(lattice,1)-1
    for j=1:(size(lattice,2)-1)
        if lattice(i,j)~=lattice(i,j+1)
            boundary(i,j)=1;
        end
        if lattice(i,j)~=lattice(i+1,j)
            boundary(i,j)=1;
        end
    end
end

boundary = logical(boundary);

end