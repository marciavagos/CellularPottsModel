function perimeter_constraint = perimeter_elasticity(lattice,flip_lattice,cell_spin,neighbour_spin)
% perimeter_constraint = perimeter_elasticity(lattice,flip_lattice,cell_spin,neighbour_spin)

global lamda_perimeter target_perimeter

if ((cell_spin ~= 0) && (neighbour_spin == 0))
    % Before flipping
    [cell_perimeter_before] = calculate_perimeter(lattice.spins,cell_spin);
    
    % After flipping
    [cell_perimeter_after] = calculate_perimeter(flip_lattice,cell_spin);
    if isempty(cell_perimeter_after); cell_perimeter_after=0; end
    
    % Deviation from target
    dP_cell_before = cell_perimeter_before - target_perimeter;
    dP_cell_after = cell_perimeter_after - target_perimeter;
    
    % Elasticity
    perimeter_constraint = lamda_perimeter*(dP_cell_after^2 - dP_cell_before^2);
    
elseif ((cell_spin == 0) && (neighbour_spin ~= 0))
    % Before flipping
    [neigh_perimeter_before] = calculate_perimeter(lattice.spins,neighbour_spin);
    
    % After flipping
    [neigh_perimeter_after] = calculate_perimeter(flip_lattice,neighbour_spin);
    if isempty(neigh_perimeter_after); neigh_perimeter_after=0; end
    
    % Deviation from target
    dP_neighbour_before = neigh_perimeter_before - target_perimeter;
    dP_neighbour_after = neigh_perimeter_after - target_perimeter;
    
    % Elasticity
    perimeter_constraint = lamda_perimeter*(dP_neighbour_after^2 - dP_neighbour_before^2);
    
else
    % Before flipping
    [cell_perimeter_before] = calculate_perimeter(lattice.spins,cell_spin);
    [neigh_perimeter_before] = calculate_perimeter(lattice.spins,neighbour_spin);
    
    % After flipping
    [cell_perimeter_after] = calculate_perimeter(flip_lattice,cell_spin);
    if isempty(cell_perimeter_after); cell_perimeter_after=0; end
    
    [neigh_perimeter_after] = calculate_perimeter(flip_lattice,neighbour_spin);
    if isempty(neigh_perimeter_after); neigh_perimeter_after=0; end
    
    % Deviation from target
    dP_cell_before = cell_perimeter_before - target_perimeter;
    dP_cell_after = cell_perimeter_after - target_perimeter;
    
    dP_neighbour_before = neigh_perimeter_before - target_perimeter;
    dP_neighbour_after = neigh_perimeter_after - target_perimeter;
    
    % Elasticity
    perimeter_constraint = lamda_perimeter*(dP_cell_after^2 + dP_neighbour_after^2 - dP_cell_before^2 - dP_neighbour_before^2);    
end

end