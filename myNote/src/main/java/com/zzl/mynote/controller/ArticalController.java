package com.zzl.mynote.controller;
import com.zzl.mynote.domain.Artical;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/articals")
@Controller
@RooWebScaffold(path = "articals", formBackingObject = Artical.class)
public class ArticalController {
}
