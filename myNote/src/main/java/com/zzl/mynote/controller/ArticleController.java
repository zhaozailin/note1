package com.zzl.mynote.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zzl.mynote.domain.Article;

@RequestMapping("/articals")
@Controller
public class ArticleController {
	@RequestMapping(value="/test")
	@ResponseBody
	public String test(Article artical) {
		return "1";
	}
}
