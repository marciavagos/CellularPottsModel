function adhesion = adhesion_energy(lattice,cell_spin,cell_type,neighbour_spin,neighbour_type,ind_cell)
% adhesion = adhesion_energy(lattice,cell_spin,cell_type,neighbour_spin,neighbour_type,ind_cell)
global Jdd Jdl JdM Jll JlM neighbourhood_size

%% Determine energy components before

[neighbour_spins,neighbour_types] = get_neighbours(lattice,ind_cell);
    
adhesion_before = 0;
for h = 1:neighourhood_size
    if neighbour_spins(h)~= cell_spin
        if neighbour_types(h)== 0
            if cell_type == 1
                adhesion_before = adhesion_before + JlM;
            elseif cell_type == 2
                adhesion_before = adhesion_before + JdM;
            end
        elseif neighbour_types(h)== 1
            if cell_type == 1
                adhesion_before = adhesion_before + Jll;
            elseif cell_type == 2
                adhesion_before = adhesion_before + Jdl;
            else
                adhesion_before = adhesion_before + JlM;
            end
        else
            if cell_type == 1
                adhesion_before = adhesion_before + Jdl;
            elseif cell_type == 2
                adhesion_before = adhesion_before + Jdd;
            else
                adhesion_before = adhesion_before + JdM;
            end
        end
    end
end

%% Determine energy components after
adhesion_after = 0;
for h = 1:neighbourhood_size
    if neighbour_spins(h)~= neighbour_spin
        if neighbour_types(h)== 0
            if neighbour_type == 1
                adhesion_after = adhesion_after + JlM;
            elseif neighbour_type == 2
                adhesion_after = adhesion_after + JdM;
            end
        elseif neighbour_types(h)== 1
            if neighbour_type == 1
                adhesion_after = adhesion_after + Jll;
            elseif neighbour_type == 2
                adhesion_after = adhesion_after + Jdl;
            else
                adhesion_after = adhesion_after + JlM;
            end
        else
            if neighbour_type == 1
                adhesion_after = adhesion_after + Jdl;
            elseif neighbour_type == 2
                adhesion_after = adhesion_after + Jdd;
            else
                adhesion_after = adhesion_after + JdM;
            end
        end
    end
end

adhesion = adhesion_after - adhesion_before;
        
end