% overlay_ts(dim_labels, ...)
% compare timeseries along each data dimension in a subplot
% dim_labels:	y-axis label for each dimension
% ...:			varargin of structs, with fields "ts", "leg", "spec"
%
% NOTE: Does not create figure
% NOTE: x-axis is always named "Time [s]"

function overlay_ts(dim_labels, varargin)
	structs = cell2mat(varargin);

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
