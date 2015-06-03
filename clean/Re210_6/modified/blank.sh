# 在每个文件夹运行这些命令 清除空行 
 for i in `ls -d */`;do sed -i '/^\s*$/d' $i/*.txt;done;
