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
	
			$('#dg').datagrid({    
			    //url:'${proPath}/supplier/selectPage.action', //通过关键字查询
			    //支持多条件查询
			    url:'${proPath}/goods/selectPageUseDyc.action', 
			    
			    fitColumns:true,
			    nowrapL:true,
			    //idField:
			    rownumbers:true,
			    pagination:true,
			    pageSize:5,
			    pageList:[2,5,10,20],
			    queryParams: {
					goodsName: '%%',
				}, 
						    
			    toolbar: [{
					iconCls: 'icon-add',
					text:'新增',
					handler: function(){
						/* parent.$('#win').window({    
						    width:600,    
						    height:400,    
						    modal:true,
						    content:"<iframe src='${proPath}/base/goURL/supplier/insert.action' height='100%' width='100%' frameborder='0px' ></iframe>"  
						});  */
					}
				},'-',{
					iconCls: 'icon-edit',
					text:'修改',
					handler: function(){
						 var array = $('#dg').datagrid('getSelections');
						if(array.length !=1){
							alert("请选择要修改的记录，并且只能选择一条记录！");
							return false;
						}
						
						//打开修改的窗口
						parent.$('#win').window({    
						    width:600,    
						    height:400,    
						    modal:true,
						    content:"<iframe src='${proPath}/base/goURL/supplier/update.action' height='100%' width='100%' frameborder='0px' ></iframe>"  
						}); 
						
					}
				},'-',{
					iconCls: 'icon-remove',
					text:'删除',
					handler: function(){
						alert('删除按钮');
						var array = $('#dg').datagrid('getSelections');
						if(array.length){
							var ids=new Array();
							for(var i=0;i<array.length;i++){
								ids[i]=array[i].supId;
							}
						}
						//alert("ids:"+ids);
						
						parent.$.messager.confirm('删除对话框', '您确认要删除吗？', function(r) {
							if (r) {
								alert(r);
								$.ajax({
									  url: "${proPath}/supplier/deleteList.action",
									  type:"POST",
									  //设置为传统方式传送参数
									  traditional:true,
									  data:{pks:ids},
									  success: function(html){
										  alert(html);
										  if(html>0){
										  	alert("恭喜您 ，删除成功，共删除了"+html+"条记录");
										  }else{
										  	alert("对不超 ，删除失败");
										  }
									  //重新刷新页面
									    $("#dg").datagrid("reload");
									    //请除所有勾选的行
									    $("#dg").datagrid("clearSelections");
									  },
									  error: function (XMLHttpRequest, textStatus, errorThrown) {
										    $.messager.alert('删除错误','请联系管理员！','error');
										},
									  dataType:'json'}
								);
							}else{
								alert("请选择需要删除的记录！");
							} 
						});
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
				title : '商品名称',
				width : 100
			}, {
				field : 'goodsUnit',
				title : '单位',
				width : 100
			}, {
				field : 'goodsType',
				title : '类型',
				width : 100
			}, {
				field : 'goodsColor',
				title : '颜色',
				width : 100,
				formatter: function(value,row,index){
					var str="${applicationScope.sysParam.goodsColor}";
					return valueToText(str,value);
				}
			}, {
				field : 'goodsStore',
				title : '库存下限',
				width : 100
			},{
				field : 'goodsLimit',
				title : '有效的修改时间',
				width : 100
			},{
				field : 'goodsCommission',
				title : '提成',
				width : 100
			},{
				field : 'goodsProducer',
				title : '生产商',
				width : 100
			},{
				field : 'goodsSelPrice',
				title : '售价',
				width : 100
			},{
				field : 'goodsBuyPrice',
				title : '进价',
				width : 100
			},{
				field : 'goodsRemark',
				title : '备注',
				width : 100
			}
			] ]
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
		
	/* 通过关键字查询
		$('#supName').searchbox({ 
			searcher:function(value,name){ 
				alert(value + "," + name); 
				$('#dg').datagrid('load',{
					keyWord: '%'+value+'%'					
				});					
			}, 
			prompt:'请输入供应商名称' 
		});
			 */ 
	});
</script>
</head>

<body>

	<table id="dg"></table>
</body>
</html>