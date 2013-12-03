package com.zzl.mynote.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zzl.mynote.domain.Article;

@RequestMapping("/articles")
@Controller
public class ArticleController {
	
	@RequestMapping(value="/queryList")
	public String queryList(Model model, 
			@RequestParam Integer pageNo, 
			@RequestParam Integer limit,
			@RequestParam(required = false) String keyword) {
		long sum = Article.queryAllList(keyword);
		
		model.addAttribute("articles", Article.queryList(pageNo, limit, keyword));
		return "article";
	}
}
