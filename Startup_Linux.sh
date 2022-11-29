#!/bin/bash

#---FUNCTION-----------------------------------------------------------------------------------------------------------
#   NAME:  性能自动化
#   DESCRIPTION:  脚本入口函数
#----------------------------------------------------------------------------------------------------------------------

function __echo_info() {
    echo "`date +'%F %T'` - [INFO] : $*"
}

run() {
	ls -l
	
	# Windows需要在系统变量中添加Jmeter根目录的位置，如下
	# JMETER_HOME="D:\Program\Jmeter\apache-jmeter-5.4.1"
	# %JMETER_HOME%\bin
	
	# Linux需要在系统变量中定义jmeter根目录的位置，如下
	export PATH=/home/Ankki.Jmeter.Test/Jmeter/apache-jmeter-5.4.1/bin:$PATH
	
	# 压测脚本模板中设定的压测时间应为60秒
	export jmx_template="Ankki.Api.Test" #压测jmx名称
	export suffix=".jmx"
	export jmx_template_filename="$jmx_template${suffix}"
	export os_type="Linux"

	__echo_info "---------> 自动化压测开始 <---------"
    rm -rf TestReport
	
	# 压测并发数列表
	thread_number_array=(10 20 40 60 80)
	# thread_number_array=(1000 2000 3000 4000 5000 6000 7000 8000 10000)
	# thread_number_array=(100000 200000 300000 400000 500000 600000 700000 800000 1000000)
	for num in "${thread_number_array[@]}"
	do
	    __echo_info "当前并发数: ${num}" 
		# 生成对应压测线程的jmx文件
		export jmx_filename="${jmx_template}_$num${suffix}"
		export jtl_filename="test_$num.jtl"

		cp ${jmx_template_filename} ${jmx_filename}
		__echo_info "生成jmx压测脚本 ${jmx_filename}"

		if [[ "${os_type}" == "Mac" ]]; then
		    sed -i "" "s/thread_num/${num}/g" ${jmx_filename}
		else
			sed -i "s/thread_num/${num}/g" ${jmx_filename}
		fi

		if [[ "${num}" > 0 ]]; then
		    mkdir -p TestReport/${jmx_template}/${num}
			# JMeter 静默压测
			__echo_info "jmeter -n -t ${jmx_filename} -l ${jtl_filename} -e -o TestReport/${jmx_template}/${num}"
			jmeter -n -t ${jmx_filename} -l ${jtl_filename} -e -o TestReport/${jmx_template}/${num}
		else
			jmeter -n -t ${jmx_filename} -l ${jtl_filename} -e -o TestReport/${jmx_template}
		fi

		rm -f ${jmx_filename} ${jtl_filename}
	done
	
	__echo_info "---------> 自动化压测全部结束 <---------"
}

run || exit 1