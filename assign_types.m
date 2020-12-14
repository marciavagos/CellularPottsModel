function lattice = assign_types(lattice,num_cells)
% Assign random types
% lattice = assign_types(lattice,num_cells)

global num_types

for i=1:num_cells
   lattice.types(lattice.spins==i) = randi(num_types);       
end

end