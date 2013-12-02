package com.zzl.mynote.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zzl.mynote.domain.Artical;

@RequestMapping("/articals")
@Controller
public class ArticalController {
	@RequestMapping(value="/test")
	@ResponseBody
	public String test(Artical artical) {
		return "1";
	}
}
