<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/common.jspf"%>
<html>
<head>


<title></title>
<style type="text/css">
.searchbox{
	margin:-3
}
</style>

<script type="text/javascript">
	$(function(){
		    var win = parent.$("iframe[title='商品采购']").get(0).contentWindow;//返回ifram页面文档（window)
			$('#dg').datagrid({    
			    //url:'${proPath}/supplier/selectPage.action', //通过关键字查询
			    //支持多条件查询
			    url:'${proPath}/goods/selectPageUseDyc.action', 
			    
			    fitColumns:true,
			    nowrapL:true,
			    //idField:
			    rownumbers:true,
			    singleSelect:true,
			    pagination:true,
			    pageSize:5,
			    pageList:[2,5,10,20],
			    queryParams: {
					goodsName: '%%',
				}, 
						    
			    toolbar: [{
					iconCls: 'icon-save',
					text:'保存',
					handler: function(){
						var row=$("#dg").datagrid("getSelected");
						if(row==null){
							alert("请选择需要采购的商品");
							return false;
						}
						
						alert(row.goodsId);
						alert($("#goodsBuyPrice").val());
						
						win.$("#dg").datagrid('appendRow',{
							goodsId:row.goodsId,
							goodsName:row.goodsName,
							goodsUnit:row.goodsUnit,
							goodsType:row.goodsType,
							goodsColor:row.goodsColor,
							bodAmount:$("#bodAmount").val(),
							bodBuyPrice:$("#goodsBuyPrice").val(),
						    goodsTotalPrice:$("#bodAmount").val()*$("#goodsBuyPrice").val(),
						    bodImeiList:$("#bodImeiList").val()
						});
	                   	  
						parent.$("#win").window("close");
					}
				},'-',{
					text:"名称：<input type='text' id='goodsName' name='goodsName'/>",					
				}],	
				
				columns : [ [{
					checkbox:true,
				}, {
				field : 'goodsId',
				title : '商品编号'
			}, {
				field : 'goodsName',
				title : '单位',
				width : 100
			}, {
				field : 'goodsUnit',
				title : ' 商品单价',
				width : 100
			}, {
				field : 'goodsType',
				title : '类型',
				width : 100
			}, {
				field : 'goodsColor',
				title : '颜色',
				width : 100
			},{
				field : 'goodsLimit',
				title : '有效的修改时间',
				width : 100
			},{
				field : 'goodsProducer',
				title : '生产商',
				width : 100
			},{
				field : 'goodsSelPrice',
				title : '售价',
				width : 100
			}] ]
				
		});
		
		$('#goodsName').searchbox({ 
			searcher:function(value,name){ 
				alert("goodsName:"+$('#goodsName').val());
				$('#dg').datagrid('load',{
					goodsName: '%'+$('#goodsName').val()+'%',
				});					
			}, 
			prompt:'' 
		}); 			
	});
</script>
</head>

<body>
    
	<table id="dg"></table>
	<form action="">
	  数量：<input type="text"  id="bodAmount" name="bodAmount"><br/>
	  进价：<input type="text" id="goodsBuyPrice" name="goodsBuyPrice"><br/>
	 手机串号：<textarea rows="" cols="" id="bodImeiList" name="bodImeiList"></textarea> 
	</form>
</body>
</html>