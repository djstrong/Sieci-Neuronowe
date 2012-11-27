





function result=kohonen(l,input_data)
  global layers
  global epochs
  inputs = size(input_data,1);
  inputs
  for i=1:inputs
      input_data(i,:) = input_data(i,:)/norm(input_data(i,:));
  end

  if (isfield(layers{l},'wins')==0)
	printf("setting wins\n");
	layers{l}.wins = {};
	for i=1:layers{l}.neurons
            layers{l}.wins{i} = 0;
   	end
  endif
  winners = zeros(layers{l}.neurons,1);

  for step=1:layers{l}.learn_steps
    if (find(epochs==step))
        epoch = find(epochs==step)
        layers{l}.weights
    endif

    for input=1:inputs
	%sprawdzamy ktory zareaguje
	for n=1:layers{l}.neurons
	    con = layers{l}.conscience_coefficient(epoch)*conscience(i,layers{l}.wins)(n);
	    winners(n) = norm(input_data(input,:)-(layers{l}.weights(n,2:end)))+con;
	end
	winner = find(winners==min(winners));
	layers{l}.wins{winner} += 1;

	%poprawiamy wagi
	for n=1:layers{l}.neurons
    	    layers{l}.weights(winner,2:end)=layers{l}.weights(winner,2:end) + ( neighbourhood(winner,n,layers{l},epoch) * ( input_data(winner,:)-layers{l}.weights(winner,2:end) ));
	end
    end
  end
results = zeros(inputs,layers{l}.neurons);
for n=1:layers{l}.neurons
    tmp = zeros(inputs,1);
    for i=1:inputs
		tmp(i,1) = dot(input_data(i,:),layers{l}.weights(n,2:end));
    end
    results(n, find(tmp==max(tmp)) ) = 1;
end
result = results;
endfunction


