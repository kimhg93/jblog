package kr.co.itcen.jblog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.jblog.service.UserService;
import kr.co.itcen.jblog.vo.UserVo;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join() {		
		return "user/join";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(UserVo vo) {	
		userService.join(vo);
		return "user/joinsuccess";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "user/login";
	}
	
	@RequestMapping(value="/auth", method=RequestMethod.POST)
	public void auth() {	
		System.out.println("로그인 됨");
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public void logout() {
		System.out.println("로그아웃 됨");
	}
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public void admin() {
		System.out.println("로그아웃 됨");
	}
	
	@ResponseBody
	@RequestMapping(value="/checkid", method=RequestMethod.GET)
	public int checkId(@RequestParam String id) {
		return userService.checkId(id);
	}
	
}
