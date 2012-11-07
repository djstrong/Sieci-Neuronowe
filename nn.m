function dataX = nn(activationFunction,Thetas,data)
    % sprawdzenie poprawności wymiarów
    inputLayerSize = size(data,2);
    previosLayerSize = inputLayerSize;
    for i=1:length(Thetas)
      assert(previosLayerSize+1, size(Thetas{i}, 2));
      previosLayerSize=size(Thetas{i}, 1);
    end

    % obliczenie
    dataX = data;
    m = size(dataX, 1);

    bias = -1.0;

    for i=1:length(Thetas) % dla każdej warstwy
      dataX = activationFunction([bias*ones(m,1) dataX]*Thetas{i}');
    end

endfunction

%funkcje aktywacji, bias, przedzial losowania dla akzdej warstwy, nazwy zmiennych