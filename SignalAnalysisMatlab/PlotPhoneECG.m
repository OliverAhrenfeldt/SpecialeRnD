%% READING THE FILES

raw = csvread('Files/RawECGData.csv');
filtered = csvread('Files/FilteredECGData.csv');

%% EXTRACT ECG DATA (Filtered)

% ECG1
ECG1 = zeros(1,size(filtered,1)*12);
Counter = 1;

for i = 1:size(filtered,1)
    row = filtered(i,1:12);
    for j = 1:length(row)
        ECG1(Counter) = row(j);
        Counter = Counter + 1;
    end
end

% ECG2
ECG2 = zeros(1,size(filtered,1)*12);
Counter = 1;

for i = 1:size(filtered,1)
    row = filtered(i,13:24);
    for j = 1:length(row)
        ECG2(Counter) = row(j);
        Counter = Counter + 1;
    end
end

% ECG3
ECG3 = zeros(1,size(filtered,1)*12);
Counter = 1;

for i = 1:size(filtered,1)
    row = filtered(i,25:36);
    for j = 1:length(row)
        ECG3(Counter) = row(j);
        Counter = Counter + 1;
    end
end

%% PLOTTING THE ECG SIGNALS

% Time axis
t = linspace(1,size(filtered,1)*12,size(filtered,1)*12);

figure(2);
% Plot
plot(t,ECG1);
hold on
plot(t,ECG2);
plot(t,ECG3);
hold off
