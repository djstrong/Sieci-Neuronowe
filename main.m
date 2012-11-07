conf_file = argv(){1};
load(conf_file);

activation = menu("Wybierz funkcje aktywacji","Liniowa","Skokowa","Sigmoidalna");

if (activation==1)
   a = input("Parametr a: ");
   b = input("Parametr b: ");
   activationFunction = @(X) linear(X,a,b);
elseif (activation==2)
   a = input("Prog: ");
   activationFunction = @(X) threshold(X,a);
elseif (activation==3)
   activationFunction = @sigmoid;
endif

thetas = {};
if (random_weights>0)
   input_cols = size(input_data,2);
   cols = input_cols;
   for i=1:size(layer_neuron,1)
	thetas{i}=rand(layer_neuron(i,1),cols+1);
	cols=size(thetas{i}, 1);
   end
   thetas
else
   thetas = weights;
endif


% calculate
answers = nn(activationFunction,thetas,input_data);

% show answers
input_data
answers

if (size(results,2)==1 && size(input_data,1)==size(results,1))
  printf('Błąd: %0.4f\n', mean((answers-results).^2));
endif

% plot chart if 2 inputs and 1 output
if (size(input_data,2)==2 && size(results,2)==1 && size(input_data,1)==size(results,1))
    x=linspace(0,1,50);
    y=linspace(0,1,50);
    [xx,yy]=meshgrid(x,y);
    meshc(xx,yy,double(reshape( nn(activationFunction,thetas,[xx(:) yy(:)]), size(xx))) )
    pause
endif