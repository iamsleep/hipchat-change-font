!#/bin/bash
# 0 for cross multiple line match, ref: http://stackoverflow.com/questions/16742526/how-do-i-search-and-replace-across-multiple-lines-with-perl
# i for inline replace
# p for loop
# e for one line expression
cp /Applications/HipChat.app/Contents/Resources/chat.html ~/chat.html.orig
cp /Applications/HipChat.app/Contents/Resources/chat.html ~/chat.html
perl -0p -i.bak -e '
s/font-family: Menlo,/font-family: Cosolas, Menlo,/g;
s/font-family: Helvetica Neue,/font-family: Consolas, Helvetica Neue,/g;
s/monospace;\n(\ *)font-size: 12px;/monospace;\n$1font-size: 14px;/g;

# change color theme
s/2472ad/89B1DD/g;
s/205081/89B1DD/g;
s/3572b0/9D84DF/g;

s/\/\*# sourceMappingURL=hipchat-client.css.map \*\/\n(\ *)<\/style>/\/\*# sourceMappingURL=hipchat-client.css.map \*\/\n$1#hipchat .hc-left-sidebar-col,\n#hipchat .hc-right-sidebar-col {\n  font-family: Consolas, sans-serif !important;\n}\n<\/style>/g
' ~/chat.html
