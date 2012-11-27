function con=conscience(step, wins)
	wins;
	x = (ones(size(wins,2),1)*1/step);
	x;
	con=abs([wins{:}] - x');
	con;

endfunction
