// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.zzl.mynote.domain;

import com.zzl.mynote.domain.Article;
import com.zzl.mynote.domain.ArticleType;
import java.util.Set;

privileged aspect ArticleType_Roo_JavaBean {
    
    public String ArticleType.getName() {
        return this.name;
    }
    
    public void ArticleType.setName(String name) {
        this.name = name;
    }
    
    public Set<Article> ArticleType.getArticals() {
        return this.articals;
    }
    
    public void ArticleType.setArticals(Set<Article> articals) {
        this.articals = articals;
    }
    
}