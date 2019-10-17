package kr.co.itcen.jblog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.itcen.jblog.service.BlogService;
import kr.co.itcen.jblog.service.CategoryService;
import kr.co.itcen.jblog.service.PostService;
import kr.co.itcen.jblog.vo.BlogVo;
import kr.co.itcen.jblog.vo.CategoryVo;
import kr.co.itcen.jblog.vo.PostVo;

@Controller
@RequestMapping("/{id:(?!assets).*}")
public class BlogController {
	@Autowired
	private BlogService blogService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private PostService postService;  
	
	@RequestMapping(value= {"","/{path}","/{category}/{path}"}, method=RequestMethod.GET)
	public String index(@PathVariable String id, 
						@PathVariable(value="path", required=false)Object path, 
						@PathVariable(value="category", required=false)String category,
						Model model) {
		Long currentCategory = 0L;
		
		List<PostVo> post = postService.getList(id);	
		
		if(path!=null&&path.toString().contains("c")) {
			currentCategory = Long.parseLong(path.toString().replaceAll("c", ""));
			post = postService.getList(currentCategory);	
		} else if(path!=null) {			
			PostVo view = postService.getView(Long.parseLong(path.toString()));	
			model.addAttribute("view", view);
		}	
		
		if(category != null) {
			currentCategory = Long.parseLong(category.replaceAll("c", ""));
			post = postService.getList(currentCategory);	
		}
		
		BlogVo blog = blogService.get(id);
		blogService.updateHit(id);
		List<CategoryVo> categoryList = categoryService.getList(id);
		model.addAttribute("blog", blog);
		model.addAttribute("category", categoryList);	
		model.addAttribute("post", post);	
		
		for(CategoryVo list : categoryList) {
			if(list.getNo().equals(currentCategory)) {
				model.addAttribute("categoryName", list.getName());
				break;
			}
		}		
		model.addAttribute("currentCategory", currentCategory);
		
		return "blog/blog-main";
	}
	
	@RequestMapping(value="/admin/basic", method=RequestMethod.GET)
	public String basic(@PathVariable String id, Model model) {		
		BlogVo blog = blogService.get(id);
		model.addAttribute("blog", blog);
		return "blog/blog-admin-basic";
	}
	
	@ResponseBody
	@RequestMapping(value="/admin/basic", method=RequestMethod.POST)
	public BlogVo basic(@PathVariable String id, BlogVo vo, 
							 @RequestParam(value="logo")String beforeLogo,
							 @RequestParam(value="newlogo", required=false)MultipartFile multipartFile) {
		String logo = blogService.restore(multipartFile);	
		System.out.println("logotest>>"+beforeLogo);
		
		if(logo!=null) {
			vo.setLogo(logo);
		}
		
		vo.setId(id);
		blogService.update(vo);
		return vo;
	}
	
	@RequestMapping(value="/admin/category", method=RequestMethod.GET)
	public String category(@PathVariable String id, Model model) {
		List<CategoryVo> category = categoryService.getList(id);
		BlogVo blog = blogService.get(id);
		model.addAttribute("category", category);
		model.addAttribute("blog", blog);
		return "blog/blog-admin-category";
	}
	
	@ResponseBody
	@RequestMapping(value="/admin/category", method=RequestMethod.POST)
	public CategoryVo category(@PathVariable String id, CategoryVo vo) {
		vo.setUserId(id);
		categoryService.add(vo);
		return vo;
	}
	
	@ResponseBody
	@RequestMapping(value="/admin/deleteCategory", method=RequestMethod.POST)
	public Long deleteCategory(@PathVariable String id, CategoryVo vo) {
		vo.setUserId(id);
		categoryService.delete(vo.getNo());
		return vo.getNo();
	}	
	@RequestMapping(value="/admin/write", method=RequestMethod.GET)
	public String write(@PathVariable String id, Model model) {
		List<CategoryVo> category = categoryService.getList(id);
		BlogVo blog = blogService.get(id);
		model.addAttribute("category", category);
		model.addAttribute("blog", blog);
		return "blog/blog-admin-write";
	}
	
	@RequestMapping(value="/admin/write", method=RequestMethod.POST)
	public String write(@PathVariable String id, PostVo vo) {		
		postService.insert(vo);
		return "redirect:/"+id;
	}
	
}
