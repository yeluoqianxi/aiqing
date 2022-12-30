function get_asp_josn_string(relation) {
         var isTrue = false;
         var str;
         $.ajax({
                 url: "http://jn.wx.weixing.cn:9299/web/YCPCKB/Get_All_sj.asp",
                 type: "post",
                 async: false,
                 dataType: "text",
                 data: relation,                                       //发送到服务器的数据
                 success: function(data) {
                                          str = data
                 },
              
                 error: function() {
                                    alert("启动失败！")
                                    that.attr("disabled", false);
                                    isTrue = false;
                  }

          });
          return str;
}


function load(barArray){

//获取全部数据
let arr_sets= barArray.split('<br/>')

//重构
//计划周期和实际周期的数组
var sets_zq_zxt=arr_sets[2]
var sets_zq_zxt_list=JSON.parse(sets_zq_zxt)
var sets_zq_zxt_list_count= Object.keys(sets_zq_zxt_list).length;

var sets_zq_zxt_list_count_index=new Array()
var sets_zq_zxt_list_sjzq=new Array()
var sets_zq_zxt_list_jhzq=new Array()
var sets_zq_zxt_list_min_max=new Array()
for (var i=0;i<sets_zq_zxt_list_count;i++){
    sets_zq_zxt_list_count_index.push(i)
    sets_zq_zxt_list_sjzq.push(sets_zq_zxt_list[i].wg_sjzq)
    sets_zq_zxt_list_jhzq.push(sets_zq_zxt_list[i].wg_jhzq) 
    sets_zq_zxt_list_min_max.push(sets_zq_zxt_list[i].wg_sjzq,sets_zq_zxt_list[i].wg_jhzq)    
}

//按工序完成的数量与周期
var sets_zqts_zxzxt=arr_sets[3]
var sets_zqts_zxzxt_list=JSON.parse(sets_zqts_zxzxt)
var sets_zqts_zxzxt_list_count= Object.keys(sets_zqts_zxzxt_list).length;

var sets_zqts_zxzxt_list_count_mc=new Array()
var sets_zqts_zxzxt_list_count_ts=new Array()
var sets_zqts_zxzxt_list_count_zq=new Array()

for (var i=0;i<sets_zqts_zxzxt_list_count;i++){
    sets_zqts_zxzxt_list_count_mc.push(sets_zqts_zxzxt_list[i].GXMC)
    sets_zqts_zxzxt_list_count_ts.push(sets_zqts_zxzxt_list[i].wgts)
    sets_zqts_zxzxt_list_count_zq.push(sets_zqts_zxzxt_list[i].wgzq)     
}

//车间滚镀明细信息
var sets_mxsj=arr_sets[0]
var obj1=JSON.parse(sets_mxsj)
var count1 = Object.keys(obj1).length;

document.getElementById("mingxi").innerHTML='<h3 id="gundunbiaoti">订单信息列表</h3>   <div class="msg1" id="msg1"></div>' 
var bsd,basd1,basd2,basd3,basd4
basd1='<div id="gundo"> <marquee direction="up" behavior="scroll"  scrollamount="5" scrolldelay="10">'
bsd='<tr name="gundong"><td style="word-break: break-all; width: 15%"">工序</td>  <td style="word-break: break-all; width: 16%"">排产员</td>  <td style="word-break: break-all; width: 25%"">合同号</td>   <td style="word-break: break-all; width: 25%"">计划完工时间</td>   <td style="word-break: break-all; width: 13%"">核销标记</td></tr>'
$("#msg1").append(bsd);
$("#msg1").append(basd1); 
for (var i=0;i<count1;i++){
    a='<tr  name="gundong">';
    a+='<td style="word-break: break-all; width: 13%"">'+obj1[i].GXMC+'</td><td style="word-break: break-all; width: 11%"">'+obj1[i].DD_PCY+'</td><td style="word-break: break-all; width: 20%"">'+obj1[i].DDBH+'</td><td style="word-break: break-all; width: 35%"">'+obj1[i].WGSJ+'</td><td style="word-break: break-all; width:12%"">'+obj1[i].HEBJ+'</td>';
    a+='</tr>';
    $("#gundo").append(a);
}
basd2=' </marquee> </div> '
$("#msg1").append(basd2);
 
var timer=50;
function myScrollTop(){
         if(content.scrollTop>=content.scrollHeight-2){
           content.scrollTop=0;
         }
    else{
        content.scrollTop++
    }
}

var content=document.getElementById("gundo");
setInterval(myScrollTop,timer)

//各车间产能饱和度
var sets_cjclbhd=arr_sets[4]
var sets_cjclbhd_data=JSON.parse(sets_cjclbhd)


//周期幅度大小
var sets_zqfddx=arr_sets[1]
var sets_zqfddx_data=JSON.parse(sets_zqfddx)
//console.log(sets_zqfddx_data)

var myChart = echarts.init(document.getElementById('zhexiantu')); 
var option = {
  title:{                               //标题
         text: '周期折线图',
         left:'center',
         textStyle:{
                    color:'white',
                  fontSize:28
         } 
  },
  tooltip:{                             //提示框
         trigger: 'axis'
  },
  legend:{                              //类别
          top:"10%",
          textStyle:{
                     color:'white',
          },
          data:['计划', '实际']
  },
  grid:{                                 //图片坐标
       left: '3%',
       right: '4%',
       bottom: '3%',
       top: '16%',
       containLabel:true 
  },
  xAxis:{                               //横轴
         type: 'category',
         boundaryGap: false,
         data:[0,1,2,3,4,5,6,7,8,9,10,11,12],
         axisLine:{
                  lineStyle:{
                             color:'white',
                              width:1,//这里是为了突出显示加上的
                  }
         },
  },
  yAxis:{
         type: 'value',
         min:Math.floor(Math.min(...sets_zq_zxt_list_min_max)-2),             //在value值的axis上
         max:Math.floor(Math.max(...sets_zq_zxt_list_min_max)+3),
         axisLine:{
                  lineStyle:{
                             color:'white',
                             width:2,
                  }
         }
  },
  series:[                                             //有几个数组，就显示几个图形
  {
     name: '计划',
     type: 'line',
     data:sets_zq_zxt_list_jhzq,
     itemStyle:{
               color:'red',
               width:3
     }
  },
  {
     name: '实际',
     type: 'line',
     data:sets_zq_zxt_list_sjzq,
     itemStyle:{
               color:'blue',
               width:3
     }
  }
]
};
myChart.clear();
myChart.setOption(option);


var myChart1=echarts.init(document.getElementById('zhifangtu')); 
option = {
title: {
    text: '各工序完成情况',
    left:'center',
    textStyle:{
    //文字颜色
    color:'white',
　　fontSize:28
    }
  },
  tooltip: {
  trigger: 'axis',
  },
  /*
  toolbox: {
      feature:{
      saveAsImage:{show: true }
    }
  },
  */
  legend: {
    top:'8.5%',
    data:['条数','周期'],
    textStyle:{
        //文字颜色
        color:'white',
    }
  },
  xAxis: [
    {
      type: 'category',
      data:sets_zqts_zxzxt_list_count_mc,
      axisPointer: {                    //阴影
      type: 'shadow'
      }
     ,
      axisLine:{
      lineStyle:{
      color:'white',
      width:1,//这里是为了突出显示加上的
      }
     }
    }
  ],
  yAxis: [
   { 
      type: 'value',
      name: '条数',
      min: 0,
      max: Math.max(...sets_zqts_zxzxt_list_count_ts)+100,
      interval:100,
      axisLabel: {
      formatter: '{value} 条'
      } ,
      splitLine:{
       "show":false
      }
      ,
      axisLine:{
        lineStyle:{
        color:'white',
        width:2,//这里是为了突出显示加上的
      }
     }
    },
    {
      type: 'value',
      name: '周期',
      min: 0,
      max:Math.max(...sets_zqts_zxzxt_list_count_zq)+2,
      interval: 3,
      axisLabel: {
      formatter: '{value} 小时'
      },
      splitLine:{
       "show":false
      }
      ,
      axisLine:{
        lineStyle:{
        color:'white',
        width:2,//这里是为了突出显示加上的
      }
     }
   }
  ],
 grid: [{
           left: '10%',
           top: '16%',
           right: '11%'
       }],
  series: [
    {
      name: '条数',
      barWidth: 25, //柱子的宽度
      //barGap:'-70%',/*多个并排柱子设置柱子之间的间距*/
  	  //barCategoryGap:'50%',/*多个并排柱子设置柱子之间的间距*/
      type: 'bar',
      tooltip: {
        valueFormatter: function (value) {
          return value + '条';
        }
      },
      data:sets_zqts_zxzxt_list_count_ts,
      itemStyle: {
      color:'red'  
      }
    },
    {
      name: '周期',
      barWidth: 25,
      type: 'bar',
      yAxisIndex: 1,
      tooltip: {
        valueFormatter: function (value) {
        return value + '小时';
       }
      },
    data:sets_zqts_zxzxt_list_count_zq,
    itemStyle: {
    color:'blue',
    width:3
    }
   }
  ]
};
myChart1.clear();
myChart1.setOption(option);

var myChart2 = echarts.init(document.getElementById('shanxinzhanbi')); 
option = {
title:{
    text: '车间各产能情况',
    top: 'auto',
    left: 'center',
    textStyle:{
        color:'white',
        fontStyle:'normal',
        fontWeight:'bold',
        fontFamily:'sans-serif',
　　　　fontSize:28
    }
  },
  tooltip: {
     trigger: 'item',
     color:'white'
  },
  legend: {
    //orient: 'vertical',                //垂直分布
    top: '15%',
    left: 'center',
    textStyle:{
        //文字颜色
        color:'white',
    }
  },
 grid: [{
           left: '10%',
           top: '50%',
           right: '10%'
       }],
series:[
  {
    name: '车间产能情况',
    type: 'pie',
    radius: '60%',
   //labelLine: {
   //show: false
   //},
    label: {
      show: false,
    },
    data: [
      { value: sets_cjclbhd_data[0].wccl,name: '已完成',itemStyle:{color:'red'} },
      { value: sets_cjclbhd_data[0].wwccl, name: '未完成',itemStyle:{color:'blue'} }
     ],
    emphasis: {
      itemStyle: {
        shadowBlur: 10,
        shadowOffsetX:0,
        shadowColor: 'rgba(0, 0, 0, 0.5)'
      }
    }
  }
]
}; 
//myChart2.clear();
//myChart2.setOption(option);
//使用刚指定的配置项和数据显示图表。
myChart2.setOption(option,true);
//清空画布，防止缓存
myChart2.clear();
//使用刚指定的配置项和数据显示图表。
myChart2.setOption(option,true);


var myChart3 = echarts.init(document.getElementById('zhouqizf')); 
option = {
  title: {
    text: '车间周期情况',
    /* subtext: 'Fake Data', */
    left: 'center',
    textStyle:{
        //文字颜色
        color:'white',
        //字体风格,'normal','italic','oblique'
        fontStyle:'normal',
        //字体粗细 'normal','bold','bolder','lighter',100 | 200 | 300 | 400...
        fontWeight:'bold',
        //字体系列
        fontFamily:'sans-serif',
        //字体大小
　　　　fontSize:28
    }
  },
  tooltip: {
     trigger: 'item',
     color:'white'
  },
  /*
  toolbox: {
      feature:{
      saveAsImage:{show: true }
    }
  },
  */
 grid:[{
           left: '25%',
           top: '20%',
           right: '20%'
       }],
  xAxis: {
     type: 'value',
     splitLine:{
       "show":false
      }
     ,
     interval:100,
     axisLine:{
     lineStyle:{
     color:'white',
     width:2,//这里是为了突出显示加上的
     }
    }
  },
    yAxis: {
    type: 'category',
    data: ['全部计划周期', '完成计划周期', '完成实际周期'],
    axisLabel: {
         textStyle: {
         fontSize: 15,
         // padding: [5,0,0,0],
         color: 'white',
         }
     },
    axisLine:{
    lineStyle:{
    color:'white',
    width:3,//这里是为了突出显示加上的
      }
    }   
},
series:[
    {
      barWidth: 25, //柱子的宽度
      data: [sets_zqfddx_data[0].all_jhzq, sets_zqfddx_data[0].wg_jhzq, sets_zqfddx_data[0].wg_sjzq],
      type: 'bar',
      //color:function(d){return "#"+Math.floor(Math.random()*(256*256*256-1)).toString(16);} 
      itemStyle:{
         label:{
         show:true,
         position: 'right',
         textStyle: { //数值样式
                color: 'red',
                fontSize: 16
                }
         },
         color: function (params) {
                var colorList = ['red', 'blue', 'green'];
                return colorList[params.dataIndex]
         }
       }
    }
  ]
}; 
//myChart3.clear();
//myChart3.setOption(option);
//使用刚指定的配置项和数据显示图表。
myChart3.setOption(option,true);
//清空画布，防止缓存
myChart3.clear();
//使用刚指定的配置项和数据显示图表。
myChart3.setOption(option,true);

window.onresize = function(){
myChart.resize();
myChart1.resize();
myChart2.resize();
myChart3.resize();
}
/*
myChart.clear(this.option);
myChart1.clear(this.option);
myChart2.clear(this.option);
*/
}


function get_date(){
 var dasda
 dasda=document.getElementById("anniu").name
 //console.log(dasda) 
bar_relations = {
   sql_CJ:dasda
}
var  barArray=get_asp_josn_string(bar_relations)
load(barArray)
}


function get_data1(){
var barArray=get_asp_josn_string({sql_CJ:"成型" })
load(barArray)
}
