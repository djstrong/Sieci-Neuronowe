





function result=kohonen(l,input_data)
  global layers
  global epochs
  inputs = size(input_data,1);
  inputs
  for i=1:inputs
      input_data(i,:) = input_data(i,:)/norm(input_data(i,:));
  end

  if (isfield(layers{l},'potentials')==0)
	printf("setting wins\n");
  endif
  winners = zeros(layers{l}.neurons,1);

  for step=1:layers{l}.learn_steps
    if (find(epochs==step))
        epoch = find(epochs==step)
        layers{l}.weights
    endif

    potentials = layers{l}.conscience_coefficient(1)*ones(layers{l}.neurons,1);
    for input=1:inputs

	%sprawdzamy ktory zareaguje
	for n=1:layers{l}.neurons
	    winners(n) = norm(input_data(input,:)-(layers{l}.weights(n,2:end)))-potentials(n);
	end
	if (any(winners>=layers{l}.conscience_coefficient(epoch)))
		winners(find(winners<layers{l}.conscience_coefficient(epoch))) = inf;
	endif
	winner = find(winners==min(winners));
	if(size(winner,1)>1)
	    winner = winner(1);
	endif
	potentials = potentials+conscience(step,winner,layers{l},epoch);
	potentials(potentials<0)=0;
	%poprawiamy wagi
	for n=1:layers{l}.neurons
	    
    	    layers{l}.weights(n,2:end)=layers{l}.weights(n,2:end) + (layers{l}.learning_coefficient(epoch)*neighbourhood(winner,n,layers{l},epoch)*(input_data(input,:)-layers{l}.weights(n,2:end) ));
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


