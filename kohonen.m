





function result=kohonen(layer,input_data,step)
    m = size(input_data,1);
    if (isfield(layer,'wins')==0)
	layer.wins = {};
    endif
    for i=1:layer.neurons
       layer.wins{i} = 0;
    end
    output = layer.activation_function([layer.bias*ones(m,1) input_data]*layer.weights');
    % wybrac, ktory zareaguje - wg wykładu - ten, który dał największy output
    for input=1:m
	%sumienie
	candidates = output(input,:)-layer.conscience_coefficient*conscience(i,layer.wins);
	candidates;
	winner = find(candidates==max(candidates));
	layer.wins{winner} += 1;

	%poprawic wagi
	for n=1:layer.neurons
    	    layer.weights(winner,:)=layer.weights(winner,:)+ layer.learning_coefficient * neighbourhood(winner,n,layer.neighbourhood_coefficient) * ([layer.bias*1 input_data(winner,:)]-layer.weights(winner,:));
	end
    end

result = layer.activation_function([layer.bias*ones(m,1) input_data]*layer.weights');
endfunction


