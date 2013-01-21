function result=bp(input_data,expected,step)
  global layers
  input_rows = size(input_data, 1);

  answers=input_data;
eta = 0.6;
  for i=1:input_rows
    input = input_data(i,:);
    output = expected(i,:);

    answers=input;
    a{1}=input;
    for j=1:length(layers)
      layer = layers{j};            
      answers = layer.activation_function([layer.bias*ones(1,1) answers]*layer.weights');
      a{j+1}=answers;
    endfor

    delta = {};
    j=length(layers);
    delta{j} = ((1-a{j+1}) .* a{j+1}) .* (output-a{j+1});
    layers{j}.weights = layers{j}.weights+eta * delta{j}' *[1 a{j}];


    for j=length(layers)-1:-1:1
      delta{j} = layers{j+1}.weights.*delta{j+1}'; %?
    endfor

    for j=1:length(layers)-1
%  j
      layer = layers{j};
%delta{j}
       %layer.weights
%((1-a{j+1}) .* a{j+1})
%a{j}
%delta{j}
%delta{j}(:,2:end)
sum(delta{j}(:,2:end))
      layer.weights = layer.weights+eta* (sum(delta{j}(:,2:end)) .* ((1-a{j+1}) .* a{j+1}))' *[1 a{j}];
    endfor
    a

  endfor


  return
  a={}
  a{1}=input_data;

  for i=1:length(layers)
    layer = layers{i};
    if(find(layers{i}.epochs==step))
        epochs{i} = find(layer.epochs==step);
        printf("layer %d epoch=%d\n",i,epochs{i});
        print = true;
    endif
        
    answers = layer.activation_function([layer.bias*ones(input_rows,1) answers]*layer.weights');
    a{i+1}=answers;
  endfor

  result=answers;
 
  %if learn poprawic wagi
%
%  expected_row = expected(1,1:end)
%  answers_row = answers(1,1:end)
  eta = 0.6;
%  delta_w = eta * ((expected_row-answers_row) .* (1-answers_row).* answers_row) * input_data
%  layers{1}.weights(1,1:end) = layers{1}.weights(1,1:end) + [0 delta_w];
%  expected
%  answers
%  input_data
a
  gradient = ((expected-a{length(layers)+1}) .* (1-a{length(layers)+1}) .* a{length(layers)+1})
  deltas = eta * gradient' * a{length(layers)}%input_data
  delta_bias = eta * gradient' * ones(input_rows,1)
  layers{length(layers)}.weights = layers{length(layers)}.weights +  [delta_bias deltas];

  %expected = layers{length(layers)}.weights .* [delta_bias deltas]

  del = expected-a{length(layers)+1}
  

  for i=length(layers)-1:-1:1
    %mysle, ze mozna posumowac gradient kolumnami, czyli gradient= sum(gradient, kolumnami). Powinno to ulatwic sprawe
    %g = ∑ mi * ei ... (for i=1 to r)
    g = del*layers{i+1}.weights
    %e = z * (1 - z) * g ... Error at the hidden layer neuron
    e = [ones(size(a{i+1},1), 1) (a{i+1} .* (1-a{i+1}))] .* g
    %Δθ = λ * e ... The change in θ
    del = eta * e
    %Δwi = Δθ * xi ... The change in weight i
     %wtf x?
    delw = del .* [ones(size(a{i+1},1), 1) a{i+1}]
    layers{i}.weights = layers{i}.weights +  delw

    %a{i+1}
  %  gradient = ((expected-a{i+1}) .* (1-a{i+1}) .* a{i+1})
  %  deltas = eta * gradient' * a{i} %input_data
    %delta_bias = eta * gradient' * ones(input_rows,1)
  %  layers{i}.weights = layers{i}.weights +  deltas;
  endfor



%layers{1}.weights 
endfunction
