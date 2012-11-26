function n_coeff=neighbourhood (winner,neuron,layer,epoch)
	m = zeros(layer.rows,layer.neurons/layer.rows);
	[row,col] = m(winner);
	[row2,col2] = m(neuron);
	x1 = [row col]
	x2 = [row2 col2]
	if ( norm(x1-x2,1)<=layer.neighbouhood_width)
		n_coeff = 1;
	else
		n_coeff = 0;
	endif
endfunction
