%{
GithubActions環境でlistfonts関数を実行しても、インストールしたはずのNoto Fontが出てこない
%}
listfonts

%{
listfonts関数の中では、usejava('awt')を呼び出してフォントの一覧を取得できるかチェックしているらしい。
GithubActions環境だとこの結果がfalseになるために、インストールされたフォントが出てこない…
%}
disp(["usejava('awt')", string(usejava('awt'))]);
disp(["usejava('jvm')", string(usejava('jvm'))]);
%{
この非公開APIを使って、インストールされているフォントを取得している。(GithubActions環境でも使える。)
このAPIは、JVM™ ソフトウェアにアクセスできる(usejava('jvm')がtrueになる)環境なら使える。
この結果では、NotoFontがちゃんと出てくる。
%}
fontlist = com.mathworks.mwswing.FontUtils.getFontNames.toArray();
fonts = cell(fontlist)

% 試しにfigureでも豆腐になることと、フォントの指定で豆腐が解消されることを確かめる。
f = figure();
x = 0:pi/20:2*pi;
y = sin(x);
plot(x,y);
t = text(pi,0,'\leftarrow テストsin(\pi)');
% フォントを指定しないと、日本語テキストが豆腐になる。。。
saveas(f, "test.png");
% listfontsでは出てこないけど、日本語フォントは指定できて、豆腐じゃなくなる。。。
t.FontName='Noto Serif CJK JP';
saveas(f, "test2.png");

%% 一時変数のクリア
clear 
