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
	//�����첽����
	@RequestMapping("/checkName.do")
	@ResponseBody
	public String checkName(String name){//�����name=<input id="name">��id
		//��������Ƿ����
		if ("admin".equals(name)) {
			return "0";
			
		}else {
			return "1";
		}
	}
		//������������˵�
		@RequestMapping("/getCity.do")
		@ResponseBody
		public String getCity(String provinceCode){
			if(provinceCode.equals("1")){
				return "11,�ɶ���;12,������";
			}else{
				return "21,������;22,�麣��";
			}
		}
	
}
	
/*	//��ʾҳ��
	@RequestMapping("/showRegister.do")
	public  String showRegister(){
		return "register";
	}
	//�����첽����
	@RequestMapping("/checkName.do")
	@ResponseBody         //��ʾ��������أ���Ӧ��ҳ��(��ͼ)������Ӧһ��ҳ�棨�����ƣ�����ʹ�ø�ע�⣬�����Ӧһ��һ�棬�����ø�ע�⣬�÷������Է����ַ�����Ҳ���Է������飬ʵ���࣬�����࣬modelmap���
	public String checkName(String name){
		//�ж�username�����Ϊadmin,��Ӧ������Ϣ��
		if ("admin".equals(name)) {
			//����״̬�룺0����ʾʧ�ܣ�1����ʾ�ɹ�
			return "0";
		}else{
			return "1";
		}
	}
	//ʵ�ֶ��������˵�
	@RequestMapping("/getCity.do")
	@ResponseBody    //����Ӧ��ͼ��ҳ�棩��ʹ�ø�ע��
	public String getCity(String provinceCode){
		if (provinceCode.equals("1")) {
			return "11,�ɶ���;12,������";
		}else{
			return "21,������;22,�麣��";
		}
	}*/



