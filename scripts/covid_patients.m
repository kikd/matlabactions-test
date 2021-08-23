%% ホームページからCSVファイルを取得
websave('csv/200000_nagano_covid19_patients.csv','https://www.pref.nagano.lg.jp/hoken-shippei/kenko/kenko/kansensho/joho/documents/200000_nagano_covid19_patients.csv');
display("Hello");
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
nagano_covid19_patients = readtable("../csv/200000_nagano_covid19_patients.csv", opts);

% memo:不正行を削除するのは、rmmissing関数を使用する。
% nagano_covid19_patients = rmmissing(nagano_covid19_patients)

%% 一時変数のクリア
clear opts