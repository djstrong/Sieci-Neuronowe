function con=conscience(step, wins)
	wins;
	x = (ones(size(wins,2),1)*1/step);
	con=[wins{:}] - x';
	con;

endfunction
