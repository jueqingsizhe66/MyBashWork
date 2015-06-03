#!/bin/sh 
#===============================================================================
#
#          FILE: All.sh
# 
#         USAGE: ./All.sh 
# 
#   DESCRIPTION: 
#  把他放在clean文件夹内
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: 叶昭良
#  ORGANIZATION: 
#       CREATED: 2015年05月25日 12:17
#      REVISION:  ---
#===============================================================================

# Bash的核心就是调用最有效的命令组合形成更有效的程序。
# 在单行模式下可以
#echo {userA,userB,userC}-{home,bin,data}
#echo {"userA","userB","userC"}-{"home","bin","data"}
#echo `{userA,userB,userC}-{home,bin,data}` #error
#echo '{userA,userB,userC}-{home,bin,data}'
# 分号的作用 挡任连续指令的功能！（其实也可以用换行代替）
# if [ "$?" != 0 ] 等价于  if test "$?" != 0    一定要注意[]之间有空格
# `command` 等价于 $(command)
# "" 约等于 ''  但是单引号不转义特殊字符  双引号不转义特殊字符
# $$ shell脚本号
# $* 以一个单字符显示所有脚本传递的参数 $1 
# $#  传给shell程序的位置参数个数
# $0  脚本名称
# $n  脚本的第几个参数
# $((...))  ==> x=$(($x+1)) 对括号内的表达式求值
# and   statement && statement && .. 
# or statement || statement || .. 

# if [ -f file_one ]  && [ -f file_two ]
# then
# echo "in if"
# else
# echo "in else
# fi

# [[]] 是提高版的test  比如\>必须在[]和test中使用  在[[]]直接使用！
   #  所以以后改用[[]]
#${name:-default} 使用一个默认值（一般是空值）来代替那些空的或者没有赋值的变量name；
#${name:=default}使用指定值来代替空的或者没有赋值的变量name；
#${name:?message}如果变量为空或者未赋值，那么就会显示出错误信息并中止脚本的执行同时返回退出码1。
#${#name} 给出name的长度
#${name%word} 从name的尾部开始删除与word匹配的最小部分，然后返回剩余部分
#${name%%word} 从name的尾部开始删除与word匹配的最长部分，然后返回剩余部分
#${name#word} 从name的头部开始删除与word匹配的最小部分，然后返回剩余部分
#${name##word} 从name的头部开始删除与word匹配的最长部分，然后返回剩余部分

#（注，name为变量名，word为要匹配的字符串）
#case${tao} in
#a)      echo “a” ;;
#b)      echo “b” ;;
#esac

### 一些当行运行的指令，只在prompt运行窗口才有效
#1 let
#let "sus=2**3"
#echo "sus = $sus" 
#sus=[[2**3]]
#echo "2**3"
#echo "sus = $sus",$sus
#if [ 2**3 == 8] 
#then  echo "hello"
#else
#    echo "fuck"
#fi
# 删除密度和来流动压等行
# 注意在shell #的命令行运行可以写上分号 



###  虽然有人说函数创建可以使用  
# [function] function_name[()]{
# commands
# [return ...]
#}
# 但是我发现加入function反而不行，于是使用 function_name(){}的风格
# 如何在

#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  deleteDensity
#   DESCRIPTION:  去除密度和来流经验等行  采用  awk和sed组合删除！ 并把有用信息导入modified文件夹下
#                 iconv主要是考虑到windows下的中文字符无法被识别的问题
#                  这个步骤是复制，而第三个fileintoDirNew是通过mv来操作的
#    PARAMETERS:  
#       RETURNS:  
#-------------------------------------------------------------------------------
deleteDensity()
{
echo  "删除密度和来流"
if [ -d "modified" ]
then echo "modified文件夹已存在"
else 
mkdir modified
fi
for i in `ls *.txt`
    do 
        iconv -f gb18030 -t utf-8 $i|awk '{print}'|awk '{if ($0 ~ /攻角/) {print $3;}else if($0 ~ /升力/){print $1,$4,$5}else if($0 ~ /^$/){print ''}else {print $3,$5;}}'   |sed '/密度/d'|sed '/来流动压/d'|sed '/^$/d' >modified/$i 
    done
}

# 创建文件夹 从-10攻角到25度攻角

#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  fenLei
#   DESCRIPTION:  对攻角实行分类，按照不同的攻角创建不同的文件夹
#    PARAMETERS:  
#       RETURNS:  
#-------------------------------------------------------------------------------
fenLei(){
cd modified  # 注意下面的所有函数 都运行在modified文件夹下
#for j in -10.00 -9.00 -8.00 -7.00 -6.00 -5.00 -4.00 -3.00 -2.00 -1.00 0.00 1.00 2.00 3.00 4.00 5.00 6.00 7.00 8.00 9.00 10.00 11.00 12.00 13.00 14.00 15.00 16.00 17.00 18.00 19.00 20.00 21.00 22.00 23.00 24.00 25.00 26.00 27.00 28.00 29.00 30.00
# seq 产生数字序列
for j in `seq -10.00 30.00`
    do 
        if ! [ -d "a"$j ]
        then    mkdir "a"$j
        fi
    done
}

# 导入对应攻角文件到文件夹内

#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  getFileIntoDir
#   DESCRIPTION:  使用Awk按照不同的攻角值 利用 print的功能调用shell，把对应文件拷贝到对应攻角文件夹下
#                注意-v在awk表示定义变量的间隔符
#    PARAMETERS:  
#       RETURNS:  
#-------------------------------------------------------------------------------

getFileIntoDir(){
#cd modified
#for j in -10.00 -9.00 -8.00 -7.00 -6.00 -5.00 -4.00 -3.00 -2.00 -1.00 0.00 1.00 2.00 3.00 4.00 5.00 6.00 7.00 8.00 9.00 10.00 11.00 12.00 13.00 14.00 15.00 16.00 17.00 18.00 19.00 20.00 21.00 22.00 23.00 24.00 25.00 26.00 27.00 28.00 29.00 30.00
for j in `seq -10.00 30.00`
do 
    for i in `ls *.txt`
        do 
            awk '{print}' $i |awk -v B="$i" -v A="攻角：""$j" -v C="a""$j" '$0~A{print "cp ",B," "C"/"B|"/bin/bash"}'
        done
done
}

#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  getFileIntoDirNew
#   DESCRIPTION:  新版本的getFileIntoDir 方式
#    PARAMETERS:  
#       RETURNS:  
#-------------------------------------------------------------------------------
#grep "攻角：25.00" *.txt|awk -F[:] '{print $1}'

getFileIntoDirNew(){
#for j in -10.00 -9.00 -8.00 -7.00 -6.00 -5.00 -4.00 -3.00 -2.00 -1.00 0.00 1.00 2.00 3.00 4.00 5.00 6.00 7.00 8.00 9.00 10.00 11.00 12.00 13.00 14.00 15.00 16.00 17.00 18.00 19.00 20.00 21.00 22.00 23.00 24.00 25.00 26.00 27.00 28.00 29.00 30.00
for j in `seq -10.00 30.00`
do 
        grep "攻角：$j" *.txt|awk -F[:] '{print $1}'|xargs -i mv {} "a""$j"
done

}
## 清除空行

#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  blankEmptyLine
#   DESCRIPTION:  利用sed -i命令直接处理文件中多余的空行
#    PARAMETERS:  
#       RETURNS:  
#-------------------------------------------------------------------------------
blankEmptyLine(){
# 在每个文件夹运行这些命令 清除空行 
#cd modified
for i in `ls -d */`
    do 
        sed -i '/^\s*$/d' $i/*.txt
    done
}

#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  cal
#   DESCRIPTION:  把每个攻角下的文件，利用awk执行攻角平均  升力系数平均  和压力系数平均
#    PARAMETERS:  
#       RETURNS:  
#-------------------------------------------------------------------------------
cal(){
# 在每个文件夹下都运行此计算平均值 程序
#cd modified

for i in `ls -d */`
    do 
        awk -F"[ ：]" 'BEGIN{num=0;}{if($0 ~/攻角/){f[FNR]=$1;g[FNR]=$4;num+=1;}else if($0 ~/升力系数/){f[fNR]=$1;g[FNR]+=$4;a[FNR]=$5;b[FNR]+=$9;}else if($0 ~/压力系数/){f[FNR]=$1;g[FNR]=$2}else{f[FNR]+=$1;g[FNR]+=$2;if(nbr<FNR) {nbr=FNR;}}}END{for(i=0;i<=nbr;i++){print f[i]/num,g[i]/num,a[i]/num,b[i]/num;} print num;};' $i/*.txt>$i/modified.txt
    done
}


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  plot
#   DESCRIPTION:  函数用于画图 调用gnuplot
#                 使用下面函数之前得安装gnuplot
#    PARAMETERS:  
#       RETURNS:  
#-------------------------------------------------------------------------------
plot(){

 #for i in `ls`;do num=`ls $i|wc -l`;let num=$[$num-1];sed -n '2p' $i/"modified.txt"|awk -v A=$i -v B=$num-2 '{print A,$2*B}' >> a.txt;sed -n '3p' $i/"modified.txt"|awk '{print $2}' >> a.txt;done; 

 #   sed 'N;s/\n/ :/' a.txt


# for i in `ls`;do num=`ls $i|wc -l`;let num=$[$num-1];sed -n '2p' $i/"modified.txt"|awk -v A=$i -v B=$num-2 '{print $2*B}' >> a.txt;sed -n '3p' $i/"modified.txt"|awk '{print $2}' >> a.txt;done; 
 for i in `ls`
    do 
        num=`ls $i|wc -l`
        num=$(($num-1))
        #print $i,$num
        sed -n '2p' $i/"modified.txt"|awk -v A=$i -v B=$num '{print $2*B}' >> shengli.txt
        sed -n '3p' $i/"modified.txt"|awk '{print $2}' >> shengli.txt
        sed -n '2p' $i/"modified.txt"|awk -v A=$i -v B=$num '{print $2*B}' >> zuli.txt
        sed -n '3p' $i/"modified.txt"|awk '{print $4}' >> zuli.txt
    done

sed -i 'N;s/\n/ /' shengli.txt
sort -n shengli.txt > shenglimodified.txt
sed -i 'N;s/\n/ /' zuli.txt
sort -n zuli.txt > zulimodified.txt

gnuplot<<EOF 
set ter 'png' 
set out 'shengli.png' 
plot "shenglimodified.txt" t 'cl' w lp
EOF
gnuplot<<EOF 
set ter 'png' 
set out 'zuli.png' 
plot "zulimodified.txt" t 'cd' w lp
EOF
rm -rf zuli.txt
rm -rf shengli.txt
}


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  plotCp
#   DESCRIPTION:  用于打印cp曲线
#    PARAMETERS:  
#       RETURNS:  
#-------------------------------------------------------------------------------
plotCp(){
 for i in `ls`
    do 
        if [ -d $i ]
            then sed -n '6,47p' $i/"modified.txt" >> $i/"cpUp.txt";sed -n '49,93p' $i/"modified.txt" |sort -k 2 -nr >> $i/"cpUp.txt";cpGrid
            fi
    done

}

#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  cpGrid
#   DESCRIPTION:  注意  gnuplot必须放在句首
#    PARAMETERS:  
#       RETURNS:  
#-------------------------------------------------------------------------------
cpGrid(){
gnuplot<<EOF 
set ter 'png' 
set out '$i/cpUp.png'
set xtics rotate by -45
set ytics rotate by -45
plot "$i/cpUp.txt" t 'cp' w lp
EOF
}
# 执行函数
cd $1
deleteDensity
fenLei
getFileIntoDirNew
blankEmptyLine
cal
plot
plotCp


