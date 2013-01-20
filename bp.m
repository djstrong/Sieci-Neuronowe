function result=bp(input_data,expected,step)
  global layers
  input_rows = size(input_data, 1);

  answers=input_data;

  for i=1:length(layers)
    layer = layers{i};
    if(find(layers{i}.epochs==step))
        epochs{i} = find(layer.epochs==step);
        printf("layer %d epoch=%d\n",i,epochs{i});
        print = true;
    endif
        
    answers = layer.activation_function([layer.bias*ones(input_rows,1) answers]*layer.weights');
  endfor

  result=answers;

  %if learn poprawic wagi

  layers{1}.weights = layers{1}.weights + sigmoidDerivative([layer.bias*ones(input_rows,1) input_data]*layer.weights')*(expected-answers)*[layer.bias*ones(input_rows,1) input_data];

endfunction