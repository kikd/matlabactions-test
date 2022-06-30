% この関数ではNoto Fontが出てこない
listfonts
disp(["usejava('awt')", string(usejava('awt'))]);
disp(["usejava('jvm')", string(usejava('jvm'))]);
% この非公開APIにを使うとNoto Fontが表示される。(ということは使える可能性がある？！)
fontlist = com.mathworks.mwswing.FontUtils.getFontNames.toArray();
fonts = cell(fontlist)
f = figure();
x = 0:pi/20:2*pi;
y = sin(x);
plot(x,y);
t = text(pi,0,'\leftarrow テストsin(\pi)');
% フォントを指定しないと、日本語テキストが豆腐になる。。。
saveas(f, "test.png");
% listfontsでは出てこないけど、日本語フォントは指定できるっぽい(なぜ？)
t.FontName='Noto Serif CJK JP';
saveas(f, "test2.png");

%% 一時変数のクリア
clear 
