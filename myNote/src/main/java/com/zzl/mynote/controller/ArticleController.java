package com.zzl.mynote.controller;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zzl.mynote.domain.Article;
import com.zzl.mynote.tools.WebTools;

@RequestMapping("/articles")
@Controller
public class ArticleController {
	
	@RequestMapping(value="/queryList")
	public String queryList(Model model, 
			@RequestParam Integer pageNo, 
			@RequestParam Integer limit,
			@RequestParam(required = false) String keyword) {
		long sum = Article.queryAllList(keyword);
		WebTools.setPageInfo(model, pageNo, limit, sum);
		model.addAttribute("articles", Article.queryList(pageNo, limit, keyword));
		return "article";
	}
	
	@RequestMapping(value="/view")
	@ResponseBody
	public String view(@RequestParam Long id) {
		Article article = Article.findArticle(id);
		JSONObject result = new JSONObject();
		JSONObject obj = new JSONObject();
		obj.put("title", article.getTitle());
		obj.put("content", article.getContent());
		result.put("article", obj);
		result.put("status", 1);
		return result.toString();
	}
	
	@RequestMapping(value="/save")
	@ResponseBody
	public String save(Article article) {
		JSONObject result = new JSONObject();
		article.persist();
		result.put("status", 1);
		return result.toString();
	}
}
