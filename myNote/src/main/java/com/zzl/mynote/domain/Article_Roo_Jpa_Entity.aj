// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.zzl.mynote.domain;

import com.zzl.mynote.domain.Article;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Article_Roo_Jpa_Entity {
    
    declare @type: Article: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Article.id;
    
    @Version
    @Column(name = "version")
    private Integer Article.version;
    
    public Long Article.getId() {
        return this.id;
    }
    
    public void Article.setId(Long id) {
        this.id = id;
    }
    
    public Integer Article.getVersion() {
        return this.version;
    }
    
    public void Article.setVersion(Integer version) {
        this.version = version;
    }
    
}
