function e = projection(e, a, n)
    scale = dot(a,e)/dot(e,e);
    for i = 1:n
        e(i) = scale*e(i);
    end
end