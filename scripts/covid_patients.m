display(length(ver));
listfonts
isjava = usejava('awt')
fontlist = com.mathworks.mwswing.FontUtils.getFontNames.toArray()
f = figure();
x = 0:pi/20:2*pi;
y = sin(x);
plot(x,y);
t = text(pi,0,'\leftarrow テストsin(\pi)');
saveas(f, "test.png");
% listfontsでは出てこないけど使えるのか？
t.FontName='Noto Serif CJK JP';
saveas(f, "test2.png");

%listfonts
ver

%% 一時変数のクリア
clear 
