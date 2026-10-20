function dqdt = rightHandSide(t,q)
    % q = [x;y]
    x = q(:,1);
    y= q(:,2);

    dqdt_1 = y;
    dqdt_2 = 5*(1-x.^2).*y - x;

    dqdt = [dqdt_1, dqdt_2];

end