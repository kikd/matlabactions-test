%% テキスト ファイルからのデータのインポート
% 次のテキスト ファイルからデータをインポートするスクリプト:
%
%    ファイル名: C:\work\covid19-data\200000_nagano_covid19_patients.csv
%
% MATLAB からの自動生成日: 2021/05/17 01:07:38
%% ホームページからCSVファイルを取得
websave('200000_nagano_covid19_patients.csv','https://www.pref.nagano.lg.jp/hoken-shippei/kenko/kenko/kansensho/joho/documents/200000_nagano_covid19_patients.csv');

%% インポート オプションの設定およびデータのインポート
opts = delimitedTextImportOptions("NumVariables", 15);

% 範囲と区切り記号の指定
opts.DataLines = [3, Inf];
opts.Delimiter = ",";

% 列名と型の指定
opts.VariableNames = ["No", "LocalGovCode", "Pref", "Municipalities", "ConfirmedDate", "OnsetDate", "Residence", "Age", "Gender", "Job", "Condition", "Symptom", "Traveled", "Discharged", "Remarks"];
opts.VariableTypes = ["double", "double", "string", "string", "datetime", "string", "string", "string", "string", "string", "string", "string", "double", "double", "string"];

% ファイル レベルのプロパティを指定
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% 変数プロパティを指定
opts = setvaropts(opts, ["Pref", "Municipalities", "OnsetDate", "Residence", "Age", "Gender", "Job", "Condition", "Symptom", "Remarks"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["Pref", "Municipalities", "OnsetDate", "Residence", "Age", "Gender", "Job", "Condition", "Symptom", "Remarks"], "EmptyFieldRule", "auto");
opts = setvaropts(opts, "ConfirmedDate", "InputFormat", "yyyy/MM/dd");

% データのインポート
nagano_covid19_patients = readtable("C:\work\covid19-data\200000_nagano_covid19_patients.csv", opts);


%% 一時変数のクリア
clear opts