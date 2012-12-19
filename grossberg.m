function result=grossberg(l,input_data,expected,epoch)
global layers
	if (layers{l}.learn && epoch>0)
		
		input = [zeros(size(input_data,1),1) input_data];
		coeff =layers{l}.coeffs(epoch);
		output = layers{l}.activation_function([zeros(size(input_data,1),1) input_data]*layers{l}.weights');

		for in=1:size(input,1)
			row = input(in,1:end);
			[winner_weight,win_pos] = max(row);
			for n=1:layers{l}.neurons
			   if (strcmp(layers{l}.rule,'widrow')==1)
				diff = coeff*(expected(in,n)-layers{l}.weights(n,win_pos));
				layers{l}.weights(n,win_pos) += diff;
			   else %delta
                                output2 = [zeros(size(input_data,1),1) input_data]*layers{l}.weights';
				diff = coeff*(expected(in,n)-output2(in,n))*sigmoidDerivative(output2(in,n));
				layers{l}.weights(n,win_pos) += diff;				
			   endif
			end
		end
	result = output;
        else
		result = layers{l}.activation_function([zeros(size(input_data,1),1) input_data]*layers{l}.weights');
	endif
endfunction
