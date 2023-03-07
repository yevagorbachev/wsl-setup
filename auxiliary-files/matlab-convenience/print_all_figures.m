function print_all_figures(name_fmt, varargin)
	% name_fmt: %1$d for number, %2$s for name
	% varagin: passed to print(h, filename, ...)
	for (h = findobj("type", "figure")')
		filename = sprintf(name_fmt, h.Number, h.Name);
		fprintf("Saving Fig. %d to path %s\n", h.Number, filename);
		print(h, filename, varargin{:})
	end
end
