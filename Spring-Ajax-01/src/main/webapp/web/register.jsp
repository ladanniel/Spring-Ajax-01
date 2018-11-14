<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body style="font-size: 30px;">
<!-- enctype:表示表单默认值 -->
	<form action="" enctype="application/x-www-form-urlencoded">
		姓名：<input type="text" name="name" id="name" onblur="checkName()">
		<span id="namespan"></span>
		<br>
		密码：<input type="password" name="pwd" id="pwd"><br> 
		<button type="submit">注册</button>
	</form>
	
	<br/>
	
	省份：<select id="province" onchange="getCity(this.value)">
	     <option>请选择</option>
	     <option value="1">四川省</option>
	     <option value="2">广东省</option>
	   </select>
	城市：<select id="city">
	     <option>请选择</option>
	  </select>
</body>
<script type="text/javascript">
	//获取xhr对象(以函数形式)
	function getXhr(){
		//1.定义变量
		var xhr;
		//2.两个分支；判断浏览器是否支持xhr对象
		if(window.XMLHttpRequest){
			//如果支持，直接创建对象
			xhr = new XMLHttpRequest();
		}else{
			//兼容ie5 ie6
			xhr = new ActiveXObject("Microsoft.XMLHttp");
		}
		//返回xhr
		return xhr;
	}
	
	//二级联动菜单  /cityCode：表示省份的编号,自定义参数provinceCode =this.value
	function getCity(provinceCode){
		//获取xhr对象
		var xhr = getXhr();
		//监听状态变化 (当状态是第五种状态，并且状态返回为200时，就处理)
		xhr.onreadystatechange=function(){
			if (xhr.readyState==4 && xhr.status==200) {
				var msg = xhr.responseText;
				//获取cityNode.appendChild(option);的option节点
				var cityNode =  document.getElementById("city");
				//覆盖下拉菜单重复部分、往下拉菜单中填写需要生成的部分
				cityNode.innerHTML = "<option>请选择</option>";
				//根据分好把字符串分割，并设置到数组中
				var cities = msg.split(";");
				for(var i=0;i<cities.length;i++){
					var city = cities[i].split(",");
					//option (显示的文本,表示的value值)
					var option = new Option(city[1], city[0]);
					//在city下拉列表中，添加子节点option
					cityNode.appendChild(option);
					alert(cityNode);
				}
			}
		}
		//open（打开连接）
		xhr.open("post","../user/getCity.do",true);
		//设置 请求头    当发送post请求的时，必须设置Content-Type , 请求头必须在send之前设置
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		//send（发送请求）//传送到控制器
		xhr.send("provinceCode="+provinceCode);
		
	}
	
	
	//用户名异步验证
	function checkName(){
		//1.创建xhr对象
		var xhr = getXhr();
		//2.监听状态变化
		xhr.onreadystatechange = function(){
			//如果是第五种状态，并且状态码是200
			if(xhr.readyState==4&&xhr.status==200){
				//接收服务器端的数据
				var msg = xhr.responseText;
				//在namespan节点，添加姓名是否可用的信息;
				if(msg==1){
				document.getElementById("namespan").innerHTML="姓名可以使用";
				}else{
				document.getElementById("namespan").innerHTML="姓名不可以使用";
				}
			}
		}
		//3.xhr.open();
		//获取文本框的值
		var nameValue = document.getElementById("name").value;
		xhr.open("get","../user/checkName.do?name="+nameValue,true);
		//4.xhr.send();
		xhr.send();
		
	}
</script>
</html>















