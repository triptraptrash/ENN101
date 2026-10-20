
function [t,q_rk4] = rk4_vander(f, t, dt, q0)
% RK4
% q = [x,y] !! store both values in q vector

    N = length(t);
    
    q_rk4 = zeros(N,2);
    q_rk4(1,:) = q0;
    
    for i = 1:N-1
        %pick out the entire i:th row from q vector
        qi = q_rk4(i,:);  %column vector, therefore the '
    
        %calculate stages
        %for both  and y
        %and put them in vector [t, q]
        %so first arg is time and second x and y
        k1 = f(t(i), qi);
        k2 = f(t(i) + dt/2, qi+dt/2*k1);
        k3 = f(t(i) + dt/2, qi+dt/2*k2);
        k4 = f(t(i) + dt, qi+dt*k3);
    
        q_rk4(i+1,:) = (qi + dt*(1/6*k1 +1/3*k2 + 1/3*k3 + 1/6*k4))';
    end

end