function area = calculate_area(lattice,spin)
% area = calculate_area(lattice,spin)

cell = lattice == spin;
area = length(lattice(cell));

end