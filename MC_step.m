function [lattice,energy] = MC_step(lattice)
% [lattice,energy] = MC_step(lattice)

global ES

energy=0;   

%%
for k = 1:ES
    % pick random cell a the boundary
    
    [cell_i,cell_j] = pick_cell(lattice);
    cell_spin = lattice.spins(cell_i,cell_j); 

    %% pick random neighbour
    
    [neighbour_i neighbour_j] = pick_neighbour(cell_i,cell_j);
    neighbour_spin = lattice.spins(neighbour_i,neighbour_j);
    
    %% Flip
    flip_lattice = flip_spin(lattice.spins,[cell_i,cell_j],neighbour_spin);
    
    %% Determine adhesion energy
    
    if neighbour_spin == cell_spin
        delta_H = 0; % "bonds between like spins have energy zero" (no gain in flipping spin)
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