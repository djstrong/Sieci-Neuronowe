function n_coeff=neighbourhood (winner,neuron,neighbourhood_coefficient)
	if (winner==neuron)
		n_coeff = 1;
	elseif (abs(winner-neuron)<=neighbourhood_coefficient)
		n_coeff = 1;
	else
		n_coeff = 0;
	endif
endfunction
