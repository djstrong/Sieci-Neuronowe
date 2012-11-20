conf_file = argv(){1};
source(conf_file);



if (random_weights==true)
   cols = size(input_data,2);
   for i=1:length(layers)
	layers{i}.weights = unifrnd(layers{i}.rand_min, layers{i}.rand_max, layers{i}.neurons, cols);
	printf('Wylosowane wagi warstwy %d:\n', i);
	layers{i}.weights
	cols=layers{i}.neurons;
   end
endif

m = size(input_data, 1);
m

function n_coeff=neighbourhood (winner,neuron,neighbourhood_coefficient)
	if (winner==neuron)
		n_coeff = 1;
	elseif (abs(winner-neuron)<=neighbourhood_coefficient)
		n_coeff = 1;
	else
		n_coeff = 0;
	endif
endfunction

function con=conscience(step, wins)
	wins
	x = (ones(size(wins,2),1)*1/step)
	con=[wins{:}] - x';
	con

endfunction

wins = {}
for i=1:layers{1}.neurons
   wins{i} = 0
end


for i=1:steps

	output = layers{1}.activation_function([input_data]*layers{1}.weights');
	%output
	% wybrac, ktory zareaguje - wg wykładu - ten, który dał największy output
    for input=1:m
	%sumienie
	candidates = output(input,:)-conscience(i,wins);
	candidates;
	winner = find(candidates==max(candidates));
	wins{winner} += 1;
	printf('Winner: ');
	winner

	%poprawic wagi
	for n=1:layers{1}.neurons
    	    layers{1}.weights(winner,:)=layers{1}.weights(winner,:)+ learning_coefficient*neighbourhood(winner,n,neighbourhood_coefficient)*(input_data(winner,:)-layers{1}.weights(winner,:));
	end


    end
end

output = layers{1}.activation_function([input_data]*layers{1}.weights');
output


