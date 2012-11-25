function n_coeff=neighbourhood (winner,neuron,layer,epoch)
	if (winner==neuron)
		n_coeff = 1;
	elseif (abs(winner-neuron)<=layer.neighbourhood_coefficient)
		n_coeff = 1;
	else
		n_coeff = 0;
	endif
endfunction
