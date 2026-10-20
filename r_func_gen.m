clc
syms dt
syms q [1, 2]
syms K [2, 2]
syms A [2, 2]
    %The lambda generator was written over in this while making the code
    %for the Van der Pol function generator
    r = -K+rightHandSide(dt,q+A*K*dt);
    dr = jacobian(r(:), K(:));

matlabFunction(r, dr, 'file','r_func_vander','vars',{q, dt, K, A});
