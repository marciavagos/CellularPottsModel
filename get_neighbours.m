function [neighbour_spins,neighbour_types] = get_neighbours(lattice,ind_cell)
% [neighbour_spins,neighbour_types] = get_neighbours(lattice,ind_cell,neighbourhood_size)

global neighbourhood_size

switch neighbourhood_size
    case 8
        neighbour_spins = zeros(1,8);
        neighbour_spins(1) = lattice.spins(ind_cell(1)-1,ind_cell(2)-1);
        neighbour_spins(2) = lattice.spins(ind_cell(1)-1,ind_cell(2));
        neighbour_spins(3) = lattice.spins(ind_cell(1)-1,ind_cell(2)+1);
        neighbour_spins(4) = lattice.spins(ind_cell(1),ind_cell(2)-1);
        neighbour_spins(5) = lattice.spins(ind_cell(1),ind_cell(2)+1);
        neighbour_spins(6) = lattice.spins(ind_cell(1)+1,ind_cell(2)-1);
        neighbour_spins(7) = lattice.spins(ind_cell(1)+1,ind_cell(2));
        neighbour_spins(8) = lattice.spins(ind_cell(1)+1,ind_cell(2)+1);

        neighbour_types = zeros(1,8);
        neighbour_types(1) = lattice.types(ind_cell(1)-1,ind_cell(2)-1);
        neighbour_types(2) = lattice.types(ind_cell(1)-1,ind_cell(2));
        neighbour_types(3) = lattice.types(ind_cell(1)-1,ind_cell(2)+1);
        neighbour_types(4) = lattice.types(ind_cell(1),ind_cell(2)-1);
        neighbour_types(5) = lattice.types(ind_cell(1),ind_cell(2)+1);
        neighbour_types(6) = lattice.types(ind_cell(1)+1,ind_cell(2)-1);
        neighbour_types(7) = lattice.types(ind_cell(1)+1,ind_cell(2));
        neighbour_types(8) = lattice.types(ind_cell(1)+1,ind_cell(2)+1);
    case 4
%     otherwise
        neighbour_spins = zeros(1,4);
        neighbour_spins(1) = lattice.spins(ind_cell(1)-1,ind_cell(2));
        neighbour_spins(2) = lattice.spins(ind_cell(1),ind_cell(2)-1);
        neighbour_spins(3) = lattice.spins(ind_cell(1),ind_cell(2)+1);
        neighbour_spins(4) = lattice.spins(ind_cell(1)+1,ind_cell(2));
        
        neighbour_types = zeros(1,4);
        neighbour_types(1) = lattice.types(ind_cell(1)-1,ind_cell(2));
        neighbour_types(2) = lattice.types(ind_cell(1),ind_cell(2)-1);
        neighbour_types(3) = lattice.types(ind_cell(1),ind_cell(2)+1);
        neighbour_types(4) = lattice.types(ind_cell(1)+1,ind_cell(2));
end

end