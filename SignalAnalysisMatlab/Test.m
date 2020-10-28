%% Reading EDF file (From C3 patch)
data = edfread('1234_271020_212806.edf');
% info = edfinfo('1234_271020_212806.edf');
% fs = info.NumSamples/seconds(info.DataRecordDuration);

%% Extracting data and putting it in a single array
rowCount = height(data);
tic
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


plot(t(1000:length(y1)),y1(1000:length(y1)));
hold on
plot(t(1000:length(y2)),y2(1000:length(y2)));
plot(t(1000:length(y3)),y3(1000:length(y3)));
hold off

%% Reading the RAW file (From phone)
raw = readmatrix('cortrium.csv');

rawRowCount = height(raw);

% ECG1
yr1 = zeros(1,rawRowCount*12);
yrCounter1 = 1;

for i = 1:rawRowCount
    row = raw(i,21:32);
    for j = 1:length(row)
        yr1(yrCounter1) = row(j);
        yrCounter1 = yrCounter1 + 1;
    end
end

% ECG2
yr2 = zeros(1,rawRowCount*12);
yrCounter2 = 1;

for i = 1:rawRowCount
    row = raw(i,33:44);
    for j = 1:length(row)
        yr2(yrCounter2) = row(j);
        yrCounter2 = yrCounter2 + 1;
    end
end

% ECG3
yr3 = zeros(1,rawRowCount*12);
yrCounter3 = 1;

for i = 1:rawRowCount
    row = raw(i,45:56);
    for j = 1:length(row)
        yr3(yrCounter3) = row(j);
        yrCounter3 = yrCounter3 + 1;
    end
end

% Tidsakse
t = linspace(1,rawRowCount*12,rawRowCount*12);

% Plot
plot(t,yr1);
hold on
plot(t,yr2);
plot(t,yr3);
hold off