function result=kohonen(l,input_data)
  global layers
  global epochs
  inputs = size(input_data,1);
  inputs
  for i=1:inputs
      input_data(i,:) = input_data(i,:)/norm(input_data(i,:));
  end
  
  
if (layers{l}.learn)


  if (isfield(layers{l},'potentials')==0)
	printf("setting wins\n");
  endif
  winners = zeros(layers{l}.neurons,1);
  
  for step=1:layers{l}.learn_steps
    if (find(epochs==step))
        epoch = find(epochs==step)
        layers{l}.weights
	potentials = layers{l}.conscience_coefficient(epoch)*ones(layers{l}.neurons,1);
    endif

    
    %for input=1:inputs
    input=mod(step , inputs)+1;
	%sprawdzamy ktory zareaguje
	for n=1:layers{l}.neurons
	    if (potentials(n)>=layers{l}.conscience_coefficient(epoch))
%	      winners(n) = norm(input_data(input,:)-(layers{l}.weights(n,2:end)));%-potentials(n); %poprawic na iloczyn
	      winners(n) = dot(input_data(input,:), (layers{l}.weights(n,2:end)));
	    else
		winners(n)=-inf;
	    endif
	end
	%if (any(winners>=layers{l}.conscience_coefficient(epoch)))
	%	winners(find(winners<layers{l}.conscience_coefficient(epoch))) = inf;
	%endif
	%winner = find(winners==max(winners));
	[x,winner] = max(winners);
	%if(size(winner,1)>1)
	%    winner = winner(1);
	%endif
	potentials = potentials+conscience(layers{l}.neurons,winner,layers{l},epoch);
	potentials(potentials>1.0)=1.0;
	%poprawiamy wagi
	%neigh=zeros(layers{l}.neurons,1);
	%neigh=[1:layers{l}.neurons]-winner

	%for n=1:layers{l}.neurons
	%    neigh(n) = neighbourhood(winner,n,layers{l},epoch);
	    
    	    %layers{l}.weights(n,2:end)=layers{l}.weights(n,2:end) + (layers{l}.learning_coefficient(epoch)*neighbourhood(winner,n,layers{l},epoch)*(input_data(input,:)-layers{l}.weights(n,2:end) ));
	%end

	% TODO dla wiekszej ilosci wymairow
	%neigh=abs([1:layers{l}.neurons]-winner);
	%neigh(neigh>layers{l}.neighbourhood_width(epoch))=inf;
	%neigh=1.0./(neigh'+1)
	neigh=neighbourhoods(winner,layers{l},epoch);

	%layers{l}.weights
	layers{l}.weights(:,2:end) += layers{l}.learning_coefficient(epoch)*neigh.*(input_data(input,:)-layers{l}.weights(n,2:end) );

	%layers{l}.weights
	%return
    %end
  end
endif
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


