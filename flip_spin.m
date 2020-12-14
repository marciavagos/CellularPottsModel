function lattice = flip_spin(lattice,ind_cell,spin)
% flip_lattice = flip_spin(lattice,ind_cell,spin)

lattice(ind_cell(1),ind_cell(2)) = spin;

end