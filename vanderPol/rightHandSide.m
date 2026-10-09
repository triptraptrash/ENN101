function dqdt = rightHandSide(t,q)
    % q = [x;y]
    dqdt_1 = q(2);
    dqdt_2 = 5*(1-q(1)^2)*q(2) - q(1);

    dqdt = [dqdt_1;dqdt_2];

end