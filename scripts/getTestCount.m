%% テキスト ファイルからのデータのインポート
% 次のテキスト ファイルからデータをインポートするスクリプト:
%
%    ファイル名: C:\work\covid19-data\200000_nagano_covid19_test_count.csv
%
% MATLAB からの自動生成日: 2021/05/17 01:24:42
%% ホームページからCSVファイルを取得
websave('200000_nagano_covid19_patients.csv','https://www.pref.nagano.lg.jp/hoken-shippei/kenko/kenko/kansensho/joho/documents/200000_nagano_covid19_patients.csv');
%% インポート オプションの設定およびデータのインポート
opts = delimitedTextImportOptions("NumVariables", 8);

% 範囲と区切り記号の指定
opts.DataLines = [3, Inf];
opts.Delimiter = ",";

% 列名と型の指定
opts.VariableNames = ["Date", "LocalGovCode", "Pref", "Municipalities", "InspectionNum", "Remarks", "Positive", "Negative"];
opts.VariableTypes = ["datetime", "double", "string", "string", "double", "string", "double", "double"];

% ファイル レベルのプロパティを指定
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% 変数プロパティを指定
opts = setvaropts(opts, ["Municipalities", "Remarks"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["Pref", "Municipalities", "Remarks"], "EmptyFieldRule", "auto");
opts = setvaropts(opts, "Date", "InputFormat", "yyyy/MM/dd");

% データのインポート
naganocovid19testcount = readtable("C:\work\covid19-data\200000_nagano_covid19_test_count.csv", opts);


%% 一時変数のクリア
clear opts