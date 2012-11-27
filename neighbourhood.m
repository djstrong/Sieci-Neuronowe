function n_coeff=neighbourhood (winner,neuron,layer,epoch)
	if (layer.row_count>1)
		siz = [layer.row_count layer.neurons/layer.row_count];
		[row,col] = ind2sub(siz,winner);
		[row2,col2] = ind2sub(siz,neuron);
		x1 = [row col];
		x2 = [row2 col2];
		n = norm(x1-x2,1);
	else
		n = abs(winner-neuron);
	endif
	if (n==0)
		n_coeff = 1;
	elseif (n <=layer.neighbourhood_width(epoch))
		n_coeff = 1.0/n;
	else
		n_coeff = 0;
	endif
endfunction
