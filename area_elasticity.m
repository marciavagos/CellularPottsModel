function area_constraint = area_elasticity(lattice,cell_spin,neighbour_spin)
% area_constraint = area_elasticity(lattice,cell_spin,neighbour_spin)

global lamda_area target_area

if ((cell_spin ~= 0) && (neighbour_spin == 0))
    % Before flipping
    area_cell = calculate_area(lattice.spins,cell_spin);
    dA_cell_before = area_cell - target_area;
    
    % After flipping
    dA_cell_after = dA_cell_before - 1;
    
    % Elasticity
    area_constraint = lamda_area*((dA_cell_after^2 - dA_cell_before^2)); % (1 - 2*dA_cell)
    
elseif ((cell_spin == 0) && (neighbour_spin ~= 0))
    % Before flipping
    area_neigh = calculate_area(lattice.spins,neighbour_spin);
    dA_neigh_before = area_neigh - target_area;
    
    % After flipping
    dA_neigh_after = dA_neigh_before + 1;
    
    % Elasticity
    area_constraint = lamda_area*((dA_neigh_after^2 - dA_neigh_before^2)); % (1 + 2*dA_neighbour)
    
else
    % Before flipping
    area_cell = calculate_area(lattice.spins,cell_spin);
    area_neigh = calculate_area(lattice.spins,neighbour_spin);
    dA_cell_before = area_cell - target_area;
    dA_neigh_before = area_neigh - target_area;
    
    % After flipping
    dA_cell_after = dA_cell_before - 1;
    dA_neigh_after = dA_neigh_before + 1;
    
    % Elasticity
    area_constraint = lamda_area*(dA_cell_after^2 + dA_neigh_after^2 - dA_cell_before^2 + dA_neigh_before^2); % 2*(1 - dA_cell + dA_neighbour)
    
end

end