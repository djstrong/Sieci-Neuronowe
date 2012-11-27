function con=conscience(step,winner,layer,epoch)
	con = (1.0/step)*ones(layer.neurons,1);
	con(winner) = -layer.conscience_coefficient(epoch);

endfunction
