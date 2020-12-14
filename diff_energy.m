function delta_H = diff_energy(lattice,flip_lattice,ind_cell,ind_neigh)
% delta_H = diff_energy(lattice,flip_lattice,ind_cell,ind_neigh)
% cell and neighbour have DIFFERENT spins

global adhesion_flag area_flag perimeter_flag

% Get cell and neighbour
[cell_spin,cell_type] = get_cell(lattice,ind_cell);
[neighbour_spin,neighbour_type] = get_neighbour(lattice,ind_neigh);

%% Differential Energy

delta_H = 0;
if adhesion_flag
    delta_H = delta_H + adhesion_energy(lattice,cell_spin,cell_type,neighbour_spin,neighbour_type,ind_cell);
end
if area_flag
    delta_H = delta_H + area_elasticity(lattice,cell_spin,neighbour_spin);
end
if perimeter_flag
    delta_H = delta_H + perimeter_elasticity(lattice,flip_lattice,cell_spin,neighbour_spin);
end

end
