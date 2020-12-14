function [lattice,energy] = equilibration(lattice)
% [lattice,energy] = equilibration(lattice)

global ES

energy=0;

%%
for k = 1:ES
    % Pick Random Site
    [cell_i,cell_j] = pick_cell(lattice); 
    [neighbour_i neighbour_j] = pick_neighbour(cell_i,cell_j);
    cell_spin = lattice.spins(cell_i,cell_j);
    neighbour_spin = lattice.spins(neighbour_i,neighbour_j);
    
    %% Flip
    flip_lattice = flip_spin(lattice.spins,[cell_i,cell_j],neighbour_spin);
    
    %% Determine adhesion energy
    if neighbour_spin == cell_spin
        delta_H = 0;
    else
        delta_H = diff_energy(lattice,flip_lattice,[cell_i cell_j],[neighbour_i neighbour_j]);
    end
    
    %% Update lattice
    update = accept(delta_H);
    if update
        lattice = update_lattice(lattice,[cell_i cell_j],[neighbour_i neighbour_j]);
    end
    energy = delta_H + energy;
end  
end