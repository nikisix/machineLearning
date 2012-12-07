function recoded = recode2(y,numClasses)
	recoded = zeros(length(y), numClasses);
	for i = 1:length(y) % loop through every training example
		recoded(i,y(i)) = 1;
	end %for
end %function