function ats = ts_align(ts)
	% Permutes timeseries data so that the number of rows 
	% is equal to the length of the time vector
	dat = ts.Data;
	s = size(dat);
	tdim = find(s == length(ts.Time));
	indices = 1:length(s);
	indices[tdim] = [];
	dat = permute(dat, [tdim, indices]);
	ats = timeseries(dat, ts.Time);
end
