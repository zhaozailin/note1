package com.zzl.mynote.tools;

import org.springframework.ui.Model;

public class WebTools {
	
	public static void setPageInfo(Model model, Integer pageNo, Integer limit, Long sum) {
		int totalPages = 0;
		if(sum % limit == 0) {
			totalPages = (int) (sum / limit);
		} else {
			totalPages = (int) (sum / limit) + 1;
		}
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("totalPages", totalPages);
	}
}
