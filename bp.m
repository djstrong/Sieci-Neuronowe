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
%
%  expected_row = expected(1,1:end)
%  answers_row = answers(1,1:end)
  eta = 0.6;
%  delta_w = eta * ((expected_row-answers_row) .* (1-answers_row).* answers_row) * input_data
%  layers{1}.weights(1,1:end) = layers{1}.weights(1,1:end) + [0 delta_w];
%  expected
%  answers
%  input_data
  deltas = eta * ((expected-answers) .* (1-answers) .* answers) * input_data
  delta_bias = 0;
  layers{1}.weights = layers{1}.weights +  [delta_bias*ones(input_rows,1) deltas];

endfunction
