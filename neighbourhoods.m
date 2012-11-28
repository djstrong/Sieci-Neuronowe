function neigh=neighbourhood (winner,layer,epoch)
  if (layer.row_count>1)
		siz = [layer.row_count layer.neurons/layer.row_count];
		[row,col] = ind2sub(siz,winner);
		[row2,col2] = ind2sub(siz,1:layer.neurons);
		x1 = [row col];
		x2 = [row2;col2]';
		neigh = sum(abs(x1-x2),2);
  else
	neigh=abs([1:layer.neurons]-winner);	
  endif

  neigh(neigh>layer.neighbourhood_width(epoch))=inf;
  neigh=1.0./(neigh'+1);

endfunction
