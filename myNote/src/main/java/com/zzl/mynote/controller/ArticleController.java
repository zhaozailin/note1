package com.zzl.mynote.controller;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zzl.mynote.domain.Article;
import com.zzl.mynote.tools.WebTools;
import com.zzl.mynote.vo.ArticleVO;

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
		List<Article> list = Article.queryList(pageNo, limit, keyword);
		List<ArticleVO> newList = new ArrayList<ArticleVO>();
		for(Article temp : list) {
			ArticleVO tempVO = new ArticleVO();
			tempVO.setId(temp.getId());
			tempVO.setAuthor(temp.getAuthor());
			tempVO.setBeginDate(temp.getBeginDate());
			tempVO.setLabel(temp.getLabel());
			if(temp.getType() != null) {
				tempVO.setType(temp.getType().getName());
			}
			tempVO.setUpdateDate(temp.getUpdateDate());
			tempVO.setTitle(setColor(keyword, temp.getTitle()));
			String oriContent = setColor(keyword, temp.getContent());
			/*
			 * 去掉<pre></pre>
			 */
			String newContent = oriContent.substring(5, oriContent.length() - 6);
			tempVO.setContent(newContent);
			newList.add(tempVO);
		}
		model.addAttribute("articles", newList);
		return "article";
	}
	
	private String setColor(String keyword, String oriTitle) {
		if(StringUtils.isBlank(keyword)) {
			return oriTitle;
		}
		return oriTitle.replaceAll(keyword, "<font color='red'>" + keyword + "</font>");
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
		article.setAuthor("me");
		article.setBeginDate(new Date());
		article.setUpdateDate(new Date());
		article.persist();
		result.put("status", 1);
		return result.toString();
	}
}
