// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.zzl.mynote.controller;

import com.zzl.mynote.controller.ArticalController;
import com.zzl.mynote.domain.Artical;
import com.zzl.mynote.domain.ArticalType;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect ArticalController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ArticalController.create(@Valid Artical artical, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, artical);
            return "articals/create";
        }
        uiModel.asMap().clear();
        artical.persist();
        return "redirect:/articals/" + encodeUrlPathSegment(artical.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ArticalController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Artical());
        return "articals/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ArticalController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("artical", Artical.findArtical(id));
        uiModel.addAttribute("itemId", id);
        return "articals/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ArticalController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("articals", Artical.findArticalEntries(firstResult, sizeNo));
            float nrOfPages = (float) Artical.countArticals() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("articals", Artical.findAllArticals());
        }
        addDateTimeFormatPatterns(uiModel);
        return "articals/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ArticalController.update(@Valid Artical artical, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, artical);
            return "articals/update";
        }
        uiModel.asMap().clear();
        artical.merge();
        return "redirect:/articals/" + encodeUrlPathSegment(artical.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ArticalController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Artical.findArtical(id));
        return "articals/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ArticalController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Artical artical = Artical.findArtical(id);
        artical.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/articals";
    }
    
    void ArticalController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("artical_begindate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("artical_updatedate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void ArticalController.populateEditForm(Model uiModel, Artical artical) {
        uiModel.addAttribute("artical", artical);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("articaltypes", ArticalType.findAllArticalTypes());
    }
    
    String ArticalController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
