<% Response.Addheader "Content-Type","text/html; charset=UTF-8"  %> 
<%  
    dim  rs,con,sql,count,result,count1
    set  con=Server.CreateObject("ADODB.Connection")
    con.open  connStr
    set rs=Server.CreateObject("ADODB.Recordset") 
    sql="SELECT distinct cjmc  FROM  JSSC_PCSJKB_HZSJ_GH  WHERE Typec='折线图' order by cjmc "
    rs.open  sql,con,1,1  

    result=rs.Getrows
    count=ubound(result,2)
    rs.close
    '重新打开数据集
    rs.Open sql,con,1,1
    'jsonStr = " "
    'rows = " "
%>                    
<%                    
    ' 字符分割标识
    'response.Write("@")       
    Dim anniu() 
    Redim anniu(count)      
    Dim i
    For i=0 To count
        'Set myArray(i) = server.createobject("scripting.dictionary")
        For Each e In rs.Fields    
        'response.Write(cstr(e.value))
        anniu(i)=cstr(e.value)
        Next            
        'response.Write(myArray(i))
    Rs.movenext     
    Next  
    ' Dim j
    ' For j=0 To count
    '     response.Write(myArray(j)+"</br>")
    ' next
%>  
<%
    rs.close
    con.close
    set rs = Nothing
    set con = Nothing
%>   


Dim i   As Integer
    Dim JSONstr As String
    
    JSONstr = ""
   
    If Not (rs.EOF And rs.BOF) Then
        '序列化JSON串
        rs.MoveFirst
        
        While Not rs.EOF
            
            '左边界
            JSONstr = JSONstr + "{"

            For i = 0 To rs.Fields.Count - 1
                
                '判断数据类型
                Select Case rs.Fields(i).Type
                    
                    Case DataTypeEnum.dbCurrency
                        '货币类型
                        JSONstr = JSONstr + """" + rs.Fields(i).Name + """:" + CStr(rs.Fields(i).Value) + ","
                        
                    Case DataTypeEnum.dbBigInt, DataTypeEnum.dbDecimal, DataTypeEnum.dbFloat, DataTypeEnum.dbInteger, DataTypeEnum.dbLong, DataTypeEnum.dbDouble, DataTypeEnum.dbNumeric, DataTypeEnum.dbSingle
                        '数值类型
                        JSONstr = JSONstr + """" + rs.Fields(i).Name + """:" + CStr(rs.Fields(i).Value) + ","
                    Case Else
                        '文本类型
                        JSONstr = JSONstr + """" + rs.Fields(i).Name + """:""" + CStr(rs.Fields(i).Value) + ""","
                End Select

            Next
            
            JSONstr = Left(JSONstr, Len(JSONstr) - 1)
            
            '右边界
            JSONstr = JSONstr + "},"
            
            rs.MoveNext
        Wend
        
        JSONstr = Left(JSONstr, Len(JSONstr) - 1)
        
        JSONstr = "[" + JSONstr + "]"
        
        RecordSetToJSON = JSONstr
        
    Else
        '返回空串
      RecordSetToJSON = ""    
      End If
End Function



<%
    $(document).ready(function(){
var myChart = echarts.init(document.getElementById('zhexiantu')); 
var option = {
  title: {
    text: 'Stacked Line'
  },
  tooltip: {
    trigger: 'axis'
  },
  legend: {
    data: ['Email', 'Union Ads']
  },
  grid: {
    left: '3%',
    right: '4%',
    bottom: '3%',
    containLabel:true
  },
  toolbox: {
    feature: {
      saveAsImage:{}
    }
  },
  xAxis: {
    type: 'category',
    boundaryGap: false,
    data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
  },
  yAxis: {
    type: 'value'
  },
  series: [
    {
      name: 'Email',
      type: 'line',
      stack: 'Total',
      data: [120, 132, 101, 134, 90, 230, 210]
    },
    {
      name: 'Union Ads',
      type: 'line',
      stack: 'Total',
      data: [220, 182, 191, 234, 290, 330, 310]
    }
  ]
};
myChart.setOption(option);

var  myChart1=echarts.init(document.getElementById('zhifangtu')); 
option = {
  tooltip: {
    trigger: 'axis',
    axisPointer: {
      type: 'cross',
      crossStyle: {
        color: '#999'
      }
    }
  },
  toolbox: {
    feature: {
      dataView: { show: true, readOnly: false },
      magicType: { show: true, type: ['line', 'bar'] },
      restore: { show: true },
      saveAsImage: { show: true }
    }
  },
  legend: {
    data: ['Evaporation', 'Precipitation', 'Temperature']
  },
  xAxis: [
    {
      type: 'category',
      data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
      axisPointer: {
        type: 'shadow'
      }
    }
  ],
  yAxis: [
    {
      type: 'value',
      name: 'Precipitation',
      min: 0,
      max: 250,
      interval: 50,
      axisLabel: {
        formatter: '{value} ml'
      }
    },
    {
      type: 'value',
      name: 'Temperature',
      min: 0,
      max: 25,
      interval: 5,
      axisLabel: {
        formatter: '{value} °C'
      }
    }
  ],
  series: [
    {
      name: 'Evaporation',
      type: 'bar',
      tooltip: {
        valueFormatter: function (value) {
          return value + ' ml';
        }
      },
      data: [
        2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3
      ]
    },
    {
      name: 'Precipitation',
      type: 'bar',
      tooltip: {
        valueFormatter: function (value) {
          return value + ' ml';
        }
      },
      data: [
        2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3
      ]
    },
    {
      name: 'Temperature',
      type: 'line',
      yAxisIndex: 1,
      tooltip: {
        valueFormatter: function (value) {
          return value + ' °C';
        }
      },
      data: [2.0, 2.2, 3.3, 4.5, 6.3, 10.2, 20.3, 23.4, 23.0, 16.5, 12.0, 6.2]
    }
  ]
};
 myChart1.setOption(option);

var myChart2 = echarts.init(document.getElementById('shanxinzhanbi')); 
option = {
  title: {
    text: 'Referer of a Website',
    subtext: 'Fake Data',
    left: 'center'
  },
  tooltip: {
    trigger: 'item'
  },
  legend: {
    orient: 'vertical',
    left: 'left'
  },
  series: [
    {
      name: 'Access From',
      type: 'pie',
      radius: '50%',
      data: [
        { value: 1048, name: 'Search Engine' },
        { value: 735, name: 'Direct' },
        { value: 580, name: 'Email' },
        { value: 484, name: 'Union Ads' },
        { value: 300, name: 'Video Ads' }
      ],
      emphasis: {
        itemStyle: {
          shadowBlur: 10,
          shadowOffsetX: 0,
          shadowColor: 'rgba(0, 0, 0, 0.5)'
        }
      }
    }
  ]
};
 myChart2.setOption(option);

 window.onresize = function(){
 myChart.resize();
 myChart1.resize();
 myChart2.resize();
}
}) 
    %>

option = {
  tooltip: {
    trigger: 'axis',
    axisPointer: {
      type: 'cross',
      crossStyle: {
        color: '#999'
      }
    }
  },
  toolbox: {
    feature: {
      dataView: { show: true, readOnly: false },
      magicType: { show: true, type: ['line', 'bar'] },
      restore: { show: true },
      saveAsImage: { show: true }
    }
  },
  legend: {
    data: ['Evaporation', 'Precipitation', 'Temperature']
  },
  xAxis: [
    {
      type: 'category',
      data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
      axisPointer: {
        type: 'shadow'
      }
    }
  ],
  yAxis: [
    {
      type: 'value',
      name: 'Precipitation',
      min: 0,
      max: 250,
      interval: 50,
      axisLabel: {
        formatter: '{value} ml'
      }
    },
    {
      type: 'value',
      name: 'Temperature',
      min: 0,
      max: 25,
      interval: 5,
      axisLabel: {
        formatter: '{value} °C'
      }
    }
  ],
  series: [
    {
      name: 'Evaporation',
      type: 'bar',
      tooltip: {
        valueFormatter: function (value) {
          return value + ' ml';
        }
      },
      data: [
        2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3
      ]
    },
    {
      name: 'Precipitation',
      type: 'bar',
      tooltip: {
        valueFormatter: function (value) {
          return value + ' ml';
        }
      },
      data: [
        2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3
      ]
    },
    {
      name: 'Temperature',
      type: 'line',
      yAxisIndex: 1,
      tooltip: {
        valueFormatter: function (value) {
          return value + ' °C';
        }
      },
      data: [2.0, 2.2, 3.3, 4.5, 6.3, 10.2, 20.3, 23.4, 23.0, 16.5, 12.0, 6.2]
    }
  ]
};