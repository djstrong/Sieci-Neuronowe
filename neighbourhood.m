function n_coeff=neighbourhood (winner,neuron,layer,epoch)
	m = zeros(layer.row_count,layer.neurons/layer.row_count);
	[row,col] = ind2sub(size(m),winner);
	[row2,col2] = ind2sub(size(m),neuron);
	x1 = [row col];
	x2 = [row2 col2];
	if ( norm(x1-x2,1)<=layer.neighbourhood_width)
		n_coeff = 1;
	else
		n_coeff = 0;
	endif
endfunction
