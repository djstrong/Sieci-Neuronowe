function dataX = nn(layers, input_data)
    % sprawdzenie poprawności wymiarów
    previosLayerSize = size(input_data,2); %inputLayerSize
    for i=1:length(layers)
      assert(previosLayerSize+1, size(layers{i}.weights, 2));
      previosLayerSize=size(layers{i}.weights, 1);
    end

    % obliczenie
    dataX = input_data;
    m = size(dataX, 1);

    for i=1:length(layers) % dla każdej warstwy
      dataX = layers{i}.activation_function([layers{i}.bias*ones(m,1) dataX]*layers{i}.weights');
    end
endfunction