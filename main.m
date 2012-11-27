conf_file = argv(){1};
source(conf_file);

if (random_weights==true)
   cols = size(input_data,2);
   for i=1:length(layers)
	layers{i}.weights = unifrnd(layers{i}.rand_min, layers{i}.rand_max, layers{i}.neurons, cols+1);
	printf('Wylosowane wagi warstwy %d:\n', i);
	layers{i}.weights
	cols=layers{i}.neurons;
   end
endif


% calculate

input_rows = size(input_data, 1);
for step=1:steps
	if (find(epochs==step))
          epoch = find(epochs==step)
	endif
        answers=input_data;
	for i=1:length(layers)
	    layer = layers{i};

	    if (strcmp(layer.type,'normal')==1 || layer.learn==0)
		answers = layer.activation_function([layer.bias*ones(input_rows,1) answers]*layer.weights');
	    elseif (strcmp(layer.type,'kohonen')==1)
		answers = kohonen(layer,answers,step,epoch);
	    endif
	end
	if(layer.learn==0)
		break
	endif
end

% show answers
input_data
answers

if (size(expected,2)==1 && size(input_data,1)==size(expected,1))
  printf('Błąd: %0.4f\n', mean((answers-expected).^2));
endif

% plot chart if 2 inputs and 1 output
if (size(input_data,2)==2 && size(expected,2)==1 && size(input_data,1)==size(expected,1))
    x=linspace(0,1,50);
    y=linspace(0,1,50);
    [xx,yy]=meshgrid(x,y);
    meshc(xx,yy,double(reshape( nn(layers, [xx(:) yy(:)]), size(xx))) )
    pause
endif
