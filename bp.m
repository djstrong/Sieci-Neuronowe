function result=bp(input_data,expected,stage)
  global layers
  global etas
  global momentums
  global learn
  input_rows = size(input_data, 1);
  eta = etas(stage);
  momentum = momentums(stage);
  
  r={};
  answers=input_data;
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
    r{i}=answers;

    if (learn==true)
    delta = {};
    j=length(layers);
    delta{j} = ((1-a{j+1}) .* a{j+1}) .* (output-a{j+1});
    layers{j}.weights = layers{j}.weights+eta * delta{j}' *[1 a{j}] + momentum*layers{j}.delta;
    layers{j}.delta = eta * delta{j}' *[1 a{j}] + momentum*layers{j}.delta;

    for j=length(layers)-1:-1:1
    %j=1;

      delta{j} = ((1-a{j+1}) .* a{j+1}) .* (layers{j+1}.weights*delta{j+1})(:,2:end);
      layers{j}.weights = layers{j}.weights+eta * delta{j}' *[1 a{j}] + momentum*layers{j}.delta;
      layers{j}.delta = eta * delta{j}' *[1 a{j}] + momentum*layers{j}.delta;
    endfor
    endif
  endfor

  result = zeros(length(r), length(r{1}));
  for j=1:length(r)
    result(j,:)=r{j};
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
endfunction
