function lattice = update_lattice(lattice,ind_cell,ind_neighbour)
% Update Lattice
% lattice = update_lattice(lattice,ind_cell,ind_neighbour)

lattice_temp = lattice;
lattice_temp.spins(ind_cell(1),ind_cell(2)) = lattice.spins(ind_neighbour(1),ind_neighbour(2));
lattice_temp.types(ind_cell(1),ind_cell(2)) = lattice.types(ind_neighbour(1),ind_neighbour(2));
lattice = lattice_temp;

end