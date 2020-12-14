function perimeter = calculate_perimeter(lattice,spin)
% perimeter = calculate_perimeter(lattice,spin)

cell = lattice == spin;
cell_boundary = bwmorph(cell,'thicken',1);
cell_boundary = xor(cell_boundary,cell);
perimeter = length(lattice(cell_boundary));

end