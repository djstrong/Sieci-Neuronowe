
activationFunction = @sigmoid;
a=2;
b=0;
activationFunction = @(X) linear(X,a,b);
a=7;
activationFunction = @(X) threshold(X,a);

X=[1 2 3 4; 2 73 74 84; 123 1231 1231 123]; % dane
y=[2;1;3]; % klasy

Thetas = {[1 1 2 3 4; 2 3 4 5 6],[1 2 3; 1 2 3; 2 3 4]}; % wagi dla warstw oprócz wejściowej

inputLayerSize = size(X,2);

% sprawdzenie poprawności wymiarów
previosLayerSize = inputLayerSize;
for i=1:length(Thetas)
  assert(previosLayerSize+1, size(Thetas{i}, 2));
  previosLayerSize=size(Thetas{i}, 1);
end

% obliczenie
dataX = X;
m = size(X, 1);
for i=1:length(Thetas)
  dataX = activationFunction([ones(m,1) dataX]*Thetas{i}');
end
[x,predicted] = max(dataX, [], 2);

predicted
printf('Dokładność: %f\n', mean(double(predicted == y)) * 100);