<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body style="font-size: 30px;">
	<form action="" enctype="application/x-www-form-urlencoded">
		姓名：<input type="text" name="name" id="name" onblur="checkName()">
		<span id="namespan"></span> <br> 密码：<input type="password"
			name="pwd" id="pwd"><br>
		<button type="submit">注册</button>
		<br> <br> <br>
	</form>
	省份:
	<select id="province" onchange="getCity(this.value)">
		<option>请选择</option>
		<option value="1">广东省</option>
		<option value="2">四川省</option>
		<option>
	</select> 
	城市：
	<select id="city">
		<option>请选择</option>
	</select>
</body>
<script type="text/javascript">
        function getXhr(){
        	var xhr;
        	if (window.XMLHttpRequest) {
				xhr = new XMLHttpRequest();
			}else{
				xhr = new ActiveXObject("Microsoft.XMLHttp");
			}
        	return xhr;
        }
      //监听
      function checkName(){
      xhr = getXhr();
    	xhr.onreadystatechange=function(){
    		
    		//监听发送的状态代码以及发送的状态
    		if (xhr.readyState==4&&xhr.status==200) {
				var msg = xhr.responseText;
				if (msg==1) {
					document.getElementById("namespan").innerHTML="该用户名可用";
				} else {
					document.getElementById("namespan").innerHTML="该用户名已经被占用";
				}
    		}				
    	}
    	//得到文本框的值
    	var nameValue=document.getElementById("name").value;
    	xhr.open("get","${pageContext.request.contextPath}/user/checkName.do?name="+nameValue,true);
    	xhr.send();
      }
    	
      //二级联动菜单
    function getCity(provinceCode){
    	  xhr = getXhr();
    	  xhr.onreadystatechange = function(){
    		  if (xhr.readyState==4 && xhr.status==200) {
				var msg = xhr.responseText;
				var cityNode = document.getElementById("city");
				cityNode.innerHTML = "<option>请选择</option>";
				var citys = msg.split(";");
				for (var i=0; i<citys.length;i++) {
				var city = citys[i].split(",");
				var option = new Option(city[1],city[0]);
				cityNode.appendChild(option);
				}
			}
    	  }
    	  xhr.open("post","${pageContext.request.contextPath}/user/getCity.do",true);
    	  xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
    	  xhr.send("provinceCode="+provinceCode);
    	  
      };
    	

</script>
</html>