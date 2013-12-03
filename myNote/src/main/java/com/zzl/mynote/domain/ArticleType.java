package com.zzl.mynote.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class ArticleType {

    /**
     */
    private String name;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "type")
    @OrderBy("updateDate")
    private Set<Article> articals = new HashSet<Article>();
}
