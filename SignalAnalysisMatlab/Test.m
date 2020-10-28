%% Reading EDF file (From C3 patch)
data = edfread('1234_271020_212806.edf');
% info = edfinfo('1234_271020_212806.edf');
% fs = info.NumSamples/seconds(info.DataRecordDuration);

%% Extracting data and putting it in a single array
columnCount = height(data);

% Tidsakse
t = linspace(1,columnCount*12,columnCount*12);

% Værdier
y = zeros(1,columnCount*12);
yCounter = 1;

for i = 1:columnCount
    row = cell2mat(data.ECG1(i))';
    for j = 1:length(row)
        y(yCounter) = row(j);
        yCounter = yCounter + 1;
    end
end

plot(t(1000:length(y),y(1000:length(y))));

%% Reading the RAW file (From phone)
