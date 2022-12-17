function overlay_ts(structs, dim_labels)
	% Compare arbitrary width timeseries
	% structs:		struture array of {ts, leg, spec}
	% dim_labels:	y-label for each dimension
	
	widths = arrayfun(@(ts_struct) size(ts_struct.ts.Data, 2), structs);
	width = widths(1);
	if (any(widths ~= width))
		error("Unequal timeseries data widths");
	end
	if (width ~= length(dim_labels))
		error("Unequal data width and dimension labels");
	end
	
	legends = arrayfun(@(ts_struct) ts_struct.leg, structs);
	for (i = 1:width)
		subplot(1, width, i);
		hold on;
		for (ts_struct = structs);
			plot(ts_dim(ts_struct.ts, i), ts_struct.spec);
		end
		legend(legends);
		xlabel("Time [s]");
		ylabel(dim_labels(i))
		hold off;

	end
end
