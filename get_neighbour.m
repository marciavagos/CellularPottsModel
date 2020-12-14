function [neighbour_spin,neighbour_type] = get_neighbour(lattice,ind_neigh)
% [neighbour_spin,neighbour_type] = get_neighbour(lattice,ind_neigh)

neighbour_spin = lattice.types(ind_neigh(1),ind_neigh(2));
neighbour_type = lattice.types(ind_neigh(1),ind_neigh(2));

end