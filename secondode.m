% Coupling the ordinary differential equation

function dXdt = secondode(t,X,k,m,d)
	
dXdt=[X(2) ; -(k/m)*X(1)-(d/m)*X(2)];