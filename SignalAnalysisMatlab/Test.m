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

%% Reading the RAW file (From phone)

% BEGINNING OF AUTOGENERATED CODE USING IMPORT TOOL
%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 94);

% Specify range and delimiter
opts.DataLines = [1, Inf];
opts.Delimiter = [" ", ","];

% Specify column names and types
opts.VariableNames = ["Var1", "Var2", "Var3", "VarName4", "VarName5", "VarName6", "VarName7", "VarName8", "VarName9", "VarName10", "VarName11", "VarName12", "VarName13", "VarName14", "VarName15", "VarName16", "VarName17", "VarName18", "VarName19", "VarName20", "VarName21", "VarName22", "VarName23", "VarName24", "VarName25", "VarName26", "VarName27", "VarName28", "VarName29", "VarName30", "VarName31", "VarName32", "VarName33", "VarName34", "VarName35", "VarName36", "VarName37", "VarName38", "VarName39", "VarName40", "VarName41", "VarName42", "VarName43", "VarName44", "VarName45", "VarName46", "VarName47", "VarName48", "VarName49", "VarName50", "VarName51", "VarName52", "VarName53", "VarName54", "VarName55", "VarName56", "VarName57", "VarName58", "VarName59", "VarName60", "VarName61", "VarName62", "VarName63", "VarName64", "VarName65", "VarName66", "VarName67", "VarName68", "VarName69", "VarName70", "VarName71", "VarName72", "VarName73", "VarName74", "VarName75", "VarName76", "VarName77", "VarName78", "VarName79", "VarName80", "VarName81", "VarName82", "VarName83", "VarName84", "VarName85", "VarName86", "VarName87", "VarName88", "VarName89", "VarName90", "VarName91", "VarName92", "VarName93", "VarName94"];
opts.SelectedVariableNames = ["VarName4", "VarName5", "VarName6", "VarName7", "VarName8", "VarName9", "VarName10", "VarName11", "VarName12", "VarName13", "VarName14", "VarName15", "VarName16", "VarName17", "VarName18", "VarName19", "VarName20", "VarName21", "VarName22", "VarName23", "VarName24", "VarName25", "VarName26", "VarName27", "VarName28", "VarName29", "VarName30", "VarName31", "VarName32", "VarName33", "VarName34", "VarName35", "VarName36", "VarName37", "VarName38", "VarName39", "VarName40", "VarName41", "VarName42", "VarName43", "VarName44", "VarName45", "VarName46", "VarName47", "VarName48", "VarName49", "VarName50", "VarName51", "VarName52", "VarName53", "VarName54", "VarName55", "VarName56", "VarName57", "VarName58", "VarName59", "VarName60", "VarName61", "VarName62", "VarName63", "VarName64", "VarName65", "VarName66", "VarName67", "VarName68", "VarName69", "VarName70", "VarName71", "VarName72", "VarName73", "VarName74", "VarName75", "VarName76", "VarName77", "VarName78", "VarName79", "VarName80", "VarName81", "VarName82", "VarName83", "VarName84", "VarName85", "VarName86", "VarName87", "VarName88", "VarName89", "VarName90", "VarName91", "VarName92", "VarName93", "VarName94"];
opts.VariableTypes = ["string", "string", "string", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.ConsecutiveDelimitersRule = "join";

% Specify variable properties
opts = setvaropts(opts, ["Var1", "Var2", "Var3"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["Var1", "Var2", "Var3"], "EmptyFieldRule", "auto");
opts = setvaropts(opts, ["VarName4", "VarName93", "VarName94"], "TrimNonNumeric", true);
opts = setvaropts(opts, ["VarName4", "VarName93", "VarName94"], "ThousandsSeparator", ",");

% Import the data
cortrium1 = readtable("Files\RawECGData.csv", opts);
% END OF AUTOGENERATED

%% De sidste 36 (på nær allersidste)
A = table2array(cortrium1);
c = 0;                                  % Counter over antal rækker, der har indeholdt data
for i = 1:size(A,1)                     % Looper over alle rækker
    idx = ~isnan(A(i,:));               % Finder alle non-nan
    numb = A(i,idx);                    % Udtrækker non-nan tallene
    if isempty(numb)                    % Hvis der er nogle tal, fortsætter vi
        continue                        % Ellers skippes denne række
    end
    c = c+1;                            % Increaser counteren
    numb = numb(end-36:end-1);          % Udtrækker de 36 sidste tal i rækken
    s(c,1).data = numb;                 % Gemmer de sidste 36 tal i et struct
    A2(c,:) = numb;                     % Gemmer de sidste 36 tal i et array
end

%% 
endnum = 42;
A = table2array(cortrium1);
c = 0;                                  % Counter over antal rækker, der har indeholdt data
for i = 1:size(A,1)                     % Looper over alle rækker
    idx = ~isnan(A(i,:));               % Finder alle non-nan
    numb = A(i,idx);                    % Udtrækker non-nan tallene
    if isempty(numb)                    % Hvis der er nogle tal, fortsætter vi
        continue                        % Ellers skippes denne række
    end
    c = c+1;                            % Increaser counteren
    numb = numb(end-endnum-11:end-endnum); % Udtrækker de 36 sidste tal i rækken
    s(c,1).data = numb;                 % Gemmer de sidste 36 tal i et struct
    A2(c,:) = numb;                     % Gemmer de sidste 36 tal i et array
end

%% OLD Reading the RAW file (From phone)
% Only works on raw files that has just noise

% raw = readmatrix('Files/cortrium.csv');

% rawRowCount = height(raw);

A = csvread('Files/FilteredECGData.csv');

% ECG1
yr1 = zeros(1,size(A,1)*12);
yrCounter1 = 1;

for i = 1:size(A,1)
    row = A(i,1:12);
    for j = 1:length(row)
        yr1(yrCounter1) = row(j);
        yrCounter1 = yrCounter1 + 1;
    end
end

% ECG2
yr2 = zeros(1,size(A,1)*12);
yrCounter2 = 1;

for i = 1:size(A,1)
    row = A(i,13:24);
    for j = 1:length(row)
        yr2(yrCounter2) = row(j);
        yrCounter2 = yrCounter2 + 1;
    end
end

% ECG3
yr3 = zeros(1,size(A,1)*12);
yrCounter3 = 1;

for i = 1:size(A,1)
    row = A(i,25:36);
    for j = 1:length(row)
        yr3(yrCounter3) = row(j);
        yrCounter3 = yrCounter3 + 1;
    end
end

% Tidsakse
t = linspace(1,size(A,1)*12,size(A,1)*12);

figure(2);
% Plot
plot(t,yr1);
hold on
%plot(t,yr2);
%plot(t,yr3);
hold off