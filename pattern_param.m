function param = pattern_param(lattice)
% param = pattern_param(lattice)

cell_spins = unique(lattice); num_cells = length(cell_spins);
boundary_length = 0; num_sides = zeros(1,num_cells);
for i=1:num_cells
    cell = lattice == cell_spins(i);
    bound_cell = bwmorph(cell,'thicken',1);
    bound_cell = xor(bound_cell,cell); 
    num_sides(i) = length(unique(lattice(bound_cell))); % number of neighbour cells
    boundary_length = boundary_length + length(lattice(bound_cell)); % length(find(bound_cell));
end

cell_medium_boundary = bwmorph(lattice ~= 0,'thicken',1);
cell_medium_boundary = xor(cell_medium_boundary,lattice ~= 0);
cell_medium_boundary = length(lattice(cell_medium_boundary));
mean_num_sides = mean(num_sides);
miu_2 = 0; miu_3 = 0; miu_4 = 0;
sides = unique(num_sides); 
for n=1:length(sides)
    c = (sides(n) - mean_num_sides);
    d = num_sides(num_sides==sides(n));
    prob = length(d)/num_cells;
    % Momenta
    miu_2 = miu_2 + prob*c^2; 
    miu_3 = miu_3 + prob*c^3; 
    miu_4 = miu_4 + prob*c^4;
end
param.boundary_length = boundary_length;
param.cell_medium_boundary = cell_medium_boundary;
param.mean_num_sides = mean_num_sides;
param.miu_2 = miu_2;
param.miu_3 = miu_3;
param.miu_4 = miu_4;

end
    