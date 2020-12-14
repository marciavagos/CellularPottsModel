function [cell_i,cell_j] = pick_cell(lattice)
% [cell_i,cell_j] = pick_cell(lattice)

global size_latt_i size_latt_j
    
    % Check if cell site is at the boundary
    cell_i = randi([10 size_latt_i-10]);
    cell_j = randi([10 size_latt_j-10]);
    num_neighbours = unique(lattice.spins(cell_i-1:cell_i+1,cell_j-1:cell_j+1));
    
    % Check if cell site is on the boundary
    while (num_neighbours == 1) % | (lattice.types(cell_i,cell_j) == 0)
        cell_i = randi([2 size_latt_i-1]);
        cell_j = randi([2 size_latt_j-1]);
        num_neighbours = length(unique(lattice.spins(cell_i-1:cell_i+1,cell_j-1:cell_j+1)));
    end
end