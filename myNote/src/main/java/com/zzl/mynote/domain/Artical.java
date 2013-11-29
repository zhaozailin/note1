package com.zzl.mynote.domain;
import javax.persistence.Lob;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Artical {

    /**
     */
	@Lob
    private String content;
}
