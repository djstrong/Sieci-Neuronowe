function result=grossberg(l,input_data,expected,epoch)
	if (epoch>0)
		global layers
		input = [zeros(size(input_data,1),1) input_data];
		coeff =layers{l}.coeffs(epoch);
		output = layers{l}.activation_function([zeros(size(input_data,1),1) input_data]*layers{l}.weights');
		input_data
		expected
		output
		for in=1:size(input,1)
			for n=1:layers{l}.neurons
				row = input(in,1:end);
				[winner_weight,win_pos] = max(row);
				diff = -coeff*(expected(in,n)-layers{l}.weights(n,win_pos))
				layers{l}.weights(n,win_pos) += diff;
			end
		end
	result = output;
        else
		result = [];
	endif
endfunction
