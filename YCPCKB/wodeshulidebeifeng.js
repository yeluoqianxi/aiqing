function get_asp_josn_string(relation) {
    var isTrue = false;
    var str;
    $.ajax({
        url: "http://localhost:54323/Get_All_sj.asp",
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
// 请求的条件
/*
function get_date_ss(sads){
var disdis = {
   sql_CJ:asds
    }
console.log(get_asp_josn_string(disdis))
}
*/

/*
console.log(get_asp_josn_string({sql_CJ:"成型" }))
*/

function get_date(){
 var dasda
 dasda=document.getElementById("anniu").name
 //console.log(dasda) 
 var bar_relations = {
   sql_CJ:dasda
}
barArray=get_asp_josn_string(bar_relations)
console.log(barArray)
}

$(document).ready(function(){
var myChart = echarts.init(document.getElementById('zhexiantu')); 
var option = {
   title: {                               //标题
      text: '周期折线图',
      left:'center',
      textStyle:{
         //文字颜色
         color:'white',
　　     fontSize:28
      } 
   },
   tooltip: {                             //提示框
      trigger: 'axis'
   },
   legend: {                              //类别
       top:"10%",
       textStyle:{
       //文字颜色
       color:'white',
       },
       data: ['计划', '实际']
   },
   grid: {                                 //图片坐标
      left: '3%',
      right: '4%',
      bottom: '3%',
      top: '16%',
      containLabel:true 
   },
   toolbox: {                             // 工具箱
     feature: {
       saveAsImage:{}
     }
   },
   xAxis: {                               //横轴
       type: 'category',
       boundaryGap: false,
       data: ['1','2','3','4','5','6','7','8'],
       axisLine:{
          lineStyle:{
             color:'white',
             width:1,//这里是为了突出显示加上的
          }
       }
   },
   yAxis: {                                 //纵轴
      type: 'value',
      axisLine:{
         lineStyle:{
            color:'white',
            width:2,//这里是为了突出显示加上的
         }
      }
   },
   series:[                                     //有几个数组，就显示几个图形
      {
         name: '计划',
         type: 'line',
         stack: 'Total',
         data: [120,132,101,134,90,80,120,460] ,
         itemStyle: {
            color:'red',
            width:3
         }
      },
      {
          name: '实际',
          type: 'line',
          stack: 'Total',
          data: [220,182,191,234,290,170,190,240,355],
          itemStyle: {
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
  toolbox: {
      feature: {
      saveAsImage: { show: true }
    }
  },
  legend: {
    top:'8.5%',
    data: ['条数', '周期'],
    textStyle:{
        //文字颜色
        color:'white',
    }
  },
  xAxis: [
    {
      type: 'category',
      data: ['五金装配', '有色漆', '成型', '压铸', '滚镀', '挂镀', '洗油'],
      axisPointer: {
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
      max: 400,
      interval: 50,
      axisLabel: {
        formatter: '{value} 条'
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
      max: 24,
      interval: 3,
      axisLabel: {
      formatter: '{value} 天'
      },
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
           right: '10%'
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
      data: [
        2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6
      ],
      itemStyle: {
      color:'red'  
      }
    },
    {
      name: '周期',
      type: 'line',
      yAxisIndex: 1,
      tooltip: {
        valueFormatter: function (value) {
        return value + '天';
       }
      },
    data: [2.0, 2.2, 3.3, 4.5, 6.3, 10.2, 20.3],
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
    /* subtext: 'Fake Data', */
    top: 'auto',
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
  toolbox: { 
    feature: {
      saveAsImage:{}
    }
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
    name: '车间质量情况',
    type: 'pie',
    radius: '60%',
   //labelLine: {
   //show: false
   //},
    label: {
      show: false,
    },
    data: [
      { value: 1048,name: '已完成',itemStyle:{color:'red'} },
      { value: 735, name: '未完成',itemStyle:{color:'blue'} }
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
  toolbox: { 
    feature: {
      saveAsImage:{}
    }
  },   
 grid:[{
           left: '20%',
           top: '20%',
           right: '20%'
       }],
  xAxis: {
     type: 'value',
     min:0,
     max:500,
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
      data: [120, 200, 150],
      type: 'bar',
      //color:function(d){return "#"+Math.floor(Math.random()*(256*256*256-1)).toString(16);} 
      itemStyle:{
         color: function (params) {
                var colorList = [
                    'red', 'blue', 'green'
                ];
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
}) 