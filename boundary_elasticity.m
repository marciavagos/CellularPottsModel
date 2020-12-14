function boundary_constraint = boundary_elasticity(lattice,flip_lattice,JlM)

boundary_before = bwmorph((lattice.spins ~= 0),'thicken',1);
boundary_before = length(lattice.spins(boundary_before));
boundary_after = bwmorph((flip_lattice ~= 0),'thicken',1);
boundary_after = length(flip_lattice(boundary_after));
boundary_constraint = JlM*(boundary_after - boundary_before);

end