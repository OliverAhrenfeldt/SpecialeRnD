%% Reading EDF file (From C3 patch)
data = edfread('Files/1234_301020_175117.edf');
% info = edfinfo('1234_271020_212806.edf');
% fs = info.NumSamples/seconds(info.DataRecordDuration);

% Extracting data and putting it in a single array
rowCount = height(data);

% ECG1
y1 = zeros(1,rowCount*12);
yCounter1 = 1;
for i = 1:rowCount
    row = cell2mat(data.ECG1(i))';
    for j = 1:length(row)
        y1(yCounter1) = row(j);
        yCounter1 = yCounter1 + 1;
    end
end

% ECG2
y2 = zeros(1,rowCount*12);
yCounter2 = 1;
for i = 1:rowCount
    row = cell2mat(data.ECG2(i))';
    for j = 1:length(row)
        y2(yCounter2) = row(j);
        yCounter2 = yCounter2 + 1;
    end
end

% ECG3
y3 = zeros(1,rowCount*12);
yCounter3 = 1;
for i = 1:rowCount
    row = cell2mat(data.ECG3(i))';
    for j = 1:length(row)
        y3(yCounter3) = row(j);
        yCounter3 = yCounter3 + 1;
    end
end

% Tidsakse
t = linspace(1,rowCount*12,rowCount*12);

figure(1);
plot(t(1000:length(y1)),y1(1000:length(y1)));
hold on
plot(t(1000:length(y2)),y2(1000:length(y2)));
plot(t(1000:length(y3)),y3(1000:length(y3)));
hold off