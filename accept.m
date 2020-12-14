function update = accept(delta_H)
% update = accept(delta_H,T)

global T

% Accept
update = 0;
if delta_H < 0 % Flip spin and updat lattice
    update = 1;
elseif delta_H == 0
    if T > 0
        update = 1;
    else
        if 0.5 >= rand
        update = 1;
        end
    end
else
    if T > 0
        % Metropolis probability
        if exp(-delta_H/T) >= rand
            update = 1;
        end
    end
end

end