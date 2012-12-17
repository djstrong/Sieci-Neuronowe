conf_file = argv(){1};
source(conf_file);
warning("off");
epochs = {};
if (random_weights==true)
   cols = size(input_data,2);
   for i=1:length(layers)
	if(layers{i}.random_weights)
		layers{i}.weights = unifrnd(layers{i}.rand_min, layers{i}.rand_max, layers{i}.neurons, cols+1);
		printf('Wylosowane wagi warstwy %d:\n', i);
		layers{i}.weights
	endif
	cols=layers{i}.neurons;
	layers{i}.epoch = 0;
	epochs{i} = 0;
   end
endif

%input_data = input_data/norm(input_data)
% calculate
answers = [];
input_rows = size(input_data, 1);


answers=input_data;
for step=1:learn_steps
	answers = input_data;
	for i=1:length(layers)
	    layer = layers{i};
	    if(find(layers{i}.epochs==step))
		epochs{i} = find(layer.epochs==step);
		printf("layer %d epoch=%d\n",i,epochs{i});
	    endif
	    if (strcmp(layer.type,'normal')==1)
		answers = layer.activation_function([layer.bias*ones(input_rows,1) answers]*layer.weights');
	    elseif (strcmp(layer.type,'kohonen')==1)
		answers = kohonen(i,answers,step,epochs{i});
	    elseif (strcmp(layer.type,'grossberg')==1)
		answers = grossberg(i,answers,expected,epochs{i});
	    endif
	end
end

% show answers
input_data
answers
layers{1}.weights
answers-expected



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
