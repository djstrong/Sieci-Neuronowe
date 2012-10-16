

X=[1 2 3 4; 2 73 74 84; 123 1231 1231 123]; % dane
y=[0;1;1]; % klasy

Thetas = {[1 1 2 3 4; 2 3 4 5 6],[1 2 3; 1 2 3]}; % wagi dla warstw oprócz wejściowej

inputLayerSize = size(X,2);

% check if matrixes match
previosLayerSize = inputLayerSize;
for i=1:length(Thetas)
  assert(previosLayerSize+1, size(Thetas{i}, 2));
  previosLayerSize=size(Thetas{i}, 1);
end

%layers = [5 13 10]; % wielkości kolejnych warstw

% calc
dataX = X;
m = size(X, 1);
for i=1:length(Thetas)
  dataX = sigmoid([ones(m,1) dataX]*Thetas{i}');

  %[x,p] = max(sigmoid([ones(m,1) sigmoid([ones(m,1) X]*Theta1')]*Theta2'),[],2);
end
[x,predicted] = max(dataX, [], 2)
%[x,p] = max(sigmoid([ones(m,1) sigmoid([ones(m,1) X]*Theta1')]*Theta2'),[],2);