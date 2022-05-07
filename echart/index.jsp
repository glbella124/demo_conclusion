<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!-- <style type="text/css">
		tr{height:30px;}
		td{width:40px;}
	</style>
  <script type="text/javascript" src="easyui/jquery-1.8.3.min.js"></script>
  <script type="text/javascript" src="easyui/jquery.form.js"></script> -->
<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="charts/echarts.js"></script>
</head>

<body>
	<div id="chart-panel" style="height:100%;width:100%;"></div>
	<script>
        var parList = echarts.init(document.getElementById('chart-panel'));
        var shan;//节点name
        var xiaa;//source               
        $(function() {
        	var data = [
        	    {
        	        "jgmc": "邮政发放系统",
        	        "jgid": "002",
        	        "cgts": "100",
        	        "cgl": "100%",
        	        "zts": "100",
        	        "jkxx": [
        	            {
        	                "jkdm": "dome11",
        	                "jkmc": "测试接口1",
        	                "ltzt": "success",
        	                "connect": "1"
        	            },
        	            {
        	                "jkdm": "dome12",
        	                "jkmc": "测试接口2",
        	                "ltzt": "F000001",
        	                "connect": "2"
        	            },
        	            {
        	                "jkdm": "dome13",
        	                "jkmc": "测试接口3",
        	                "ltzt": "U999999",
                            "connect": "3"
        	            }
        	        ]
        	    },
        	    {
        	        "jgmc": "启明 ",
        	        "lt_status": "001",
        	        "cgts": "100",
        	        "cgl": "100%",
        	        "zts": "100",
        	        "jkxx": [
        	            {
        	                "jkdm": "dome11",
        	                "jkmc": "测试接口",
        	                "ltzt": "success",
                            "connect": "4"
        	            },
        	            {
        	                "jkdm": "dome12",
        	                "jkmc": "测试接口",
        	                "ltzt": "F000001",
                            "connect": "5"
        	            },
        	            {
        	                "jkdm": "dome13",
        	                "jkmc": "测试接口",
        	                "ltzt": "U999999",
                            "connect": "6"
        	            }
        	        ]
        	    },
        	    {
        	        "jgmc": "呼叫中心",
        	        "lt_status": "001",
        	        "cgts": "100",
        	        "cgl": "100%",
        	        "zts": "100",
        	        "jkxx": [
        	            {
        	                "jkdm": "dome11",
        	                "jkmc": "测试接口",
        	                "ltzt": "success",
                            "connect": "7"
        	            },
        	            {
        	                "jkdm": "dome12",
        	                "jkmc": "测试接口",
        	                "ltzt": "F000001",
                            "connect": "8"
        	            },
        	            {
        	                "jkdm": "dome13",
        	                "jkmc": "测试接口",
        	                "ltzt": "U999999",
                            "connect": "9"
        	            }
        	        ]
        	    },
        	    {
        	        "jgmc": "持卡库",
        	        "lt_status": "002",
        	        "cgts": "100",
        	        "cgl": "100%",
        	        "zts": "100",
        	        "jkxx": [
        	            {
        	                "jkdm": "dome11",
        	                "jkmc": "测试接口",
        	                "ltzt": "success",
                            "connect": "10"
        	            },
        	            {
        	                "jkdm": "dome12",
        	                "jkmc": "测试接口",
        	                "ltzt": "F000001",
                            "connect": "11"
        	            },
        	            {
        	                "jkdm": "dome13",
        	                "jkmc": "测试接口",
        	                "ltzt": "U999999",
                            "connect": "12"
        	            }
        	        ]
        	    }
        	];
    		var dataArr = [];
            var linkArr = [];
        	var formatData = function(data) {
                var temp = "本平台";
                /* for(var i=0;i<data.length;i++){
                    if(data[i].lt_status=="002"){
                        temp = data[i].jgmc;
                    }
                } */
                var cen = {
                        name : temp,
                        showname:temp,
                        value : '',
                        itemStyle : {
                            normal : {
                                color : '#f90', //圆点的颜色
                                label : {
                                    position : 'bottom',
                                    textStyle : {
                                        color : '#f90'
                                    }
                                }
                            }
                        }};
                dataArr.push(cen);
                for(var j = 0;j<data.length;j++){
                    //if(data[j].lt_status=="001"){
                        var obj = {
                                name : data[j].jgmc,
                                showname: data[j].jgmc,
                                category : 0,
                                value : data[j].cgl,
                                draggable : true
                        };
                        var link = {
                                source : temp,
                                target : data[j].jgmc,
                        };
                        dataArr.push(obj);
                        linkArr.push(link);
                        //判断是否有下级，有的话循环添加
                        if(data[j].jkxx.length>0){
                            for(var k=0;k<data[j].jkxx.length;k++){
                                var objchild = {
                                        name : data[j].jkxx[k].connect,
                                        showname: data[j].jkxx[k].jkdm,
                                        category : 1,
                                        value : data[j].jkxx[k].ltzt,
                                        draggable : true
                                };
                                var linkchild = {
                                        source : data[j].jgmc,
                                        target : data[j].jkxx[k].connect,
                                };
                                dataArr.push(objchild);
                                linkArr.push(linkchild);
                            }
                        }
                  //  }
                }
                console.log(dataArr);
                console.log(linkArr);
        	}
        	
            /* $.ajax({
                        url : '${pageContext.request.contextPath}/jkgl/yxjk/djxtjk/queryJkjgJSON.action',
                        data : {},
                        type : 'post',
                        async : true,
                        dataType : 'json',
                        success : function(da) {
                            shan = da.shang;
                            xiaa = da.xia;
                            alert(shan);

                        }
                    }); */
            //初始化echarts
            var initEcharts = function(){
            	option = {
                        tooltip : {
                            show : false,
                            formatter : function(obj) {
                                if(obj.value==undefined){
                                	return obj.data.source+" > "+obj.data.target;
                                }else{
                                	return obj.seriesName+"<br/>"+obj.data.showname+" : "+obj.data.value;
                                }
                            }
                        },
                        legend : {
                            x : "center",
                            data : [ "合作","接口"]
                        },
                        animation : false,
                        series : [ {
                            type : 'graph',
                            name: "连通",
                            layout : 'force',
                            symbol : "circle",
                            symbolSize : 50,
                            roam : true, //禁止用鼠标滚轮缩小放大效果
                            edgeSymbol: ['circle', 'arrow'],
                            edgeSymbolSize : [ 0, 10 ],
                            // 连接线上的文字
                            focusNodeAdjacency : true, //划过只显示对应关系
                            edgeLabel : {
                                normal : {
                                    show : true,
                                    textStyle : {
                                        fontSize : 20
                                    },
                                    formatter : function(obj) {
                                    	console.log(obj);
                                    }
                                }
                            },
                            categories : [ {
                                name : '合作',
                                itemStyle : {
                                    normal : {
                                        color : "#009800",
                                    }
                                }
                            }, {
                                name : '接口',
                                itemStyle : {
                                    normal : {
                                        color : "#D0DFEF",
                                    }
                                }
                            } ],
                            lineStyle : {
                                normal : {
                                    opacity : 1,
                                    width : 2,
                                    curveness : 0
                                }
                            },
                            // 圆圈内的文字
                            label : {
                                normal : {
                                    show : true,
                                    formatter: function(obj) {
                                    	return obj.data.showname;
                                    }
                                }
                            },
                            force : {
                                repulsion : 5000
                            },
                            data : dataArr,
                            links : linkArr
                        } ]
                    };
                    parList.setOption(option);
                
            }
            formatData(data);
            initEcharts();
        });
    </script>
</body>
</html>
