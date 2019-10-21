package kr.co.itcen.jblog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.jblog.service.BlogService;
import kr.co.itcen.jblog.vo.BlogVo;
import kr.co.itcen.jblog.vo.CategoryVo;

@Controller
public class MainController {
	
	@Autowired
	private BlogService blogService;
	
	@RequestMapping(value= {"","/main"})
	public String main() { 
		return "main/index";
	}
	@RequestMapping(value= {"/list"})
	public String list(Model model) { 
		List<BlogVo> vo = blogService.getList();
		model.addAttribute("vo", vo);
		return "main/blog-list";
	}
}
