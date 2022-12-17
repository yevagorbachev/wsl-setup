function ts = ts_dim(ts, sel)
	% Extract sel from ts
	ts = timeseries(ts.Data(:, sel), ts.Time);
end
