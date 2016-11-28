<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title>修改供应商信息</title>
</head>
<body>

	<form id="ff" method="post">
	   <div>
			<label for="supId">供应商编号:</label> <input type="text" name="supId" readonly="readonly"/>
		</div>
		<div>
			<label for="supName">供应商:</label> <input type="text" name="supName" />
		</div>
		<div>
			<label for="supLinkman">联系人:</label> <input type="text"
				name="supLinkman" />
		</div>
		<div>
			<label for="supPhone">联系电话:</label> <input type="text"
				name="supPhone" />
		</div>
		<div>
			<label for="supAddress">联系地址:</label> <input type="text" name="supAddress" />
		</div>
				<div>
			<label for="supPay">期初应付(元):</label> <input type="text"
				name="supPay" />
		</div>
				<div>
			<label for="supType">供应商类型：</label> 									
				<select id="cc" class="easyui-combobox" name="supType" style="width:200px;">   
					<c:forEach items="${applicationScope.sysParam.supType}" var="supType">
					    <option value="${supType.key}">${supType.value}</option>   
					</c:forEach>   
				</select>  
		</div>
		<div>
			<label for="supRemark">备注:</label>
			<textarea name="supRemark"></textarea>
		</div>
		<div>
			<input id="btn" type="button" value="提交" />
		</div>
	</form>

	<script type="text/javascript">
		$(function() {
			var win = parent.$("iframe[title='供应商管理']").get(0).contentWindow;//返回ifram页面文档（window)
		    var row = win.$('#dg').datagrid('getSelected');
		    //{"supPhone":"12388888887","supAddress":"广州花都","supRemark":"普通供应商","supPay":0.00,"supType":"1","supId":1,"supName":"苹果供应商","supLinkman":"小张"},{"supPhone":"12388888666","supAddress":"广州增城","supRemark":"普通供应商","supPay":0.00,"supType":"1","supId":4,"supName":"TCL供应商","supLinkman":"小王"},{"supPhone":"12388888777","supAddress":"广东深圳","supRemark":"一级供应商","supPay":0.00,"supType":"2","supId":5,"supName":"Nokia供应商","supLinkman":"小王"},{"supPhone":"3452345","supAddress":"阿萨德发","supRemark":"阿斯顿发送到发送到发送到","supPay":12.00,"supType":"1","supId":11,"supName":"阿萨德发","supLinkman":"啊啊士大夫"}]}    
		    alert(row.supId);
		    alert(row.toString);
		    $("#ff").form('load',{
		    	supId:row.supId,
		    	supName:row.supName,
		    	supAddress:row.supAddress,
		    	supType:row.supType,
		    	supPay:row.supPay,
		    	supLinkman:row.supLinkman,
		    	supRemark:row.supRemark,
		    	supPhone:row.supPhone,
		    	supRemark:row.supRemark
		    });
		
			
			$("[name='supName']").validatebox({
				required : true,
				missingMessage : '请填写供应商！'
			});
			$("[name='supLinkman']").validatebox({
				required : true,
				missingMessage : '请填写出联系人！'
			});
			$("[name='supPhone']").validatebox({
				required : true,
				missingMessage : '请填写联系电话！'
			});
			//禁用验证
			$("#ff").form("disableValidation");

			$("#btn").click(function() {
				$("#ff").form("enableValidation");
				if ($("#ff").form("validate")) {
					$('#ff').form('submit', {
						url : '${proPath}/supplier/updateSupplier.action',
						onSubmit : function() {
							return true;
						},
						success : function(count) {							
								//可以定义为对应消息框
                        	    alert("成功");
								parent.$("#win").window("close");
								win.$("#dg").datagrid("reload");							
						}
					});

				}

			});

		});
	</script>
	
</body>
</html>
