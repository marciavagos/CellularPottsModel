function lattice = create_lattice(type)
% lattice = create_lattice(type)
% rectangular cells with width = 5 px and height 5 to 10 px

global boundary_size_x boundary_size_y N M cell_side

spins = zeros(N,M);
switch type        
    case 'rectangle'
        count=1; 
        for l = 1:cell_side:M-1
            k = 1; incr = 0;
            while incr < (N + 10)
                incr = k + cell_side-1 + randi(5);
                if incr > N; spins(l:l+cell_side-1,k:N) = count;break; end
                spins(l:l+cell_side-1,k:incr) = count;
                count = count+1; k=incr;
            end
        end
    
    case 'circle'
        r=M/(2*cell_side); c=r+1; s=c+r; 
        [x,y] = meshgrid(-(c-1):(s-c), -(c-1):(s-c));
        circle = ((x.^2 + y.^2) <= r^2);
        a = double(circle);
        
        count=1;k=1;l=1;
        for i=1:size(a,1)
            for j=1:size(a,2)
                if a(i,j)==1
                    spins(k:k+cell_side,l:l+cell_side-1)=count;
                    count=count+1;
                else
                    spins(k:k+cell_side,l:l+cell_side-1)=0;
                end
                l=l+cell_side;
            end
            k=k+cell_side;l=1;
        end
        
    case 'square'
        count=0;
        for l = 1:cell_side:M-1
            for k = 1:cell_side:N-1
                count = count+1;
                spins(l:l+cell_side-1,k:k+cell_side-1)= count;
            end
        end
end

types = ones(size(spins));
spins = padarray(spins,[boundary_size_x boundary_size_y],0);
types = padarray(types,[boundary_size_x boundary_size_y],0);
lattice.spins = spins;
lattice.types = types;

end