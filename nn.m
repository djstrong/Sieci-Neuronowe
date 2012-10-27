
%activationFunction = @(X) linear(X,a,b);

%activationFunction = @(X) threshold(X,a);
%activationFunction = @sigmoid;

%X=[1 2 3 4; 2 73 74 84; 123 1231 1231 123]; % dane
%y=[2;1;3]; % klasy
%Thetas = {[1 1 2 3 4; 2 3 4 5 6],[1 2 3; 1 2 3; 2 3 4]}; % wagi dla warstw oprócz wejściowej

% XOR
%X=[0 0; 1 0; 0 1; 1 1];
%y=[0;1;1;0];
%Thetas = {[2 -5 -5; -9 5 5],[-5 10 10]};
%activationFunction = @sigmoid;
% XOR


function nn(activationFunction,Thetas,data,results)
    inputLayerSize = size(data,2);
    % sprawdzenie poprawności wymiarów
    previosLayerSize = inputLayerSize;
    for i=1:length(Thetas)
      assert(previosLayerSize+1, size(Thetas{i}, 2));
      previosLayerSize=size(Thetas{i}, 1);
    end

    % obliczenie
    dataX = data;
    m = size(dataX, 1);

    for i=1:length(Thetas)
      dataX = activationFunction([-1.0*ones(m,1) dataX]*Thetas{i}');
    end
    dataX

    printf('Błąd: %0.4f\n', mean((dataX-results).^2));

	%kod dla wielu klas, gdzie kazde wyjscie oznacza klase
	%[x,predicted] = max(dataX, [], 2);

	%predicted;
	%printf('Dokładność: %f\n', mean(double(predicted == y)) * 100);
endfunction
