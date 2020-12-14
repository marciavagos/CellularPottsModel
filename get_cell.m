function [cell_spin,cell_type] = get_cell(lattice,ind_cell)
% [cell_spin,cell_type] = get_cell(lattice,ind_cell)

cell_spin = lattice.spins(ind_cell(1),ind_cell(2)); 
cell_type = lattice.types(ind_cell(1),ind_cell(2));

end
