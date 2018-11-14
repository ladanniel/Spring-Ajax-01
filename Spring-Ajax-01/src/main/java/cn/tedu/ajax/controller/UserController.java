package cn.tedu.ajax.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class UserController {
	@RequestMapping("/showRs.do")
	public String showRs(){
		return "re";
	}
	//处理异步请求
	@RequestMapping("/checkName.do")
	@ResponseBody
	public String checkName(String name){//这里的name=<input id="name">的id
		//检测名字是否可用
		if ("admin".equals(name)) {
			return "0";
			
		}else {
			return "1";
		}
	}
		//处理二级联动菜单
		@RequestMapping("/getCity.do")
		@ResponseBody
		public String getCity(String provinceCode){
			if(provinceCode.equals("1")){
				return "11,成都市;12,绵阳市";
			}else{
				return "21,深圳市;22,珠海市";
			}
		}
	
}
	
/*	//显示页面
	@RequestMapping("/showRegister.do")
	public  String showRegister(){
		return "register";
	}
	//处理异步请求
	@RequestMapping("/checkName.do")
	@ResponseBody         //表示如果不返回（响应）页面(视图)（不响应一个页面（的名称）），使用该注解，如果响应一个一面，不适用该注解，该方法可以返回字符串，也可以返回数组，实体类，集合类，modelmap类等
	public String checkName(String name){
		//判断username，如果为admin,响应错误信息，
		if ("admin".equals(name)) {
			//设置状态码：0：表示失败，1：表示成功
			return "0";
		}else{
			return "1";
		}
	}
	//实现二级联动菜单
	@RequestMapping("/getCity.do")
	@ResponseBody    //不响应视图（页面），使用该注解
	public String getCity(String provinceCode){
		if (provinceCode.equals("1")) {
			return "11,成都市;12,绵阳市";
		}else{
			return "21,深圳市;22,珠海市";
		}
	}*/



