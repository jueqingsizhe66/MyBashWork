# 在每个文件夹下都运行此计算平均值 程序
for i in `ls -d */`;do awk -F"[ ：]" 'BEGIN{num=0;}{if($0 ~/攻角/){f[FNR]=$1;g[FNR]=$4;num+=1;}else if($0 ~/升力系数/){f[fNR]=$1;g[FNR]+=$4;a[FNR]=$5;b[FNR]+=$9;}else if($0 ~/压力系数/){f[FNR]=$1;g[FNR]=$2}else{f[FNR]+=$1;g[FNR]+=$2;if(nbr<FNR) {nbr=FNR;}}}END{for(i=0;i<=nbr;i++){print f[i]/num,g[i]/num,a[i]/num,b[i]/num;} print num;};' $i/*.txt>$i/modified.txt; done;
