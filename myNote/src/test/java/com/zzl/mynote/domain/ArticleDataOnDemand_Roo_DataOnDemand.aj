// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.zzl.mynote.domain;

import com.zzl.mynote.domain.Article;
import com.zzl.mynote.domain.ArticleDataOnDemand;
import com.zzl.mynote.domain.ArticleTypeDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect ArticleDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ArticleDataOnDemand: @Component;
    
    private Random ArticleDataOnDemand.rnd = new SecureRandom();
    
    private List<Article> ArticleDataOnDemand.data;
    
    @Autowired
    ArticleTypeDataOnDemand ArticleDataOnDemand.articleTypeDataOnDemand;
    
    public Article ArticleDataOnDemand.getNewTransientArticle(int index) {
        Article obj = new Article();
        setAuthor(obj, index);
        setBeginDate(obj, index);
        setContent(obj, index);
        setLabel(obj, index);
        setTitle(obj, index);
        setUpdateDate(obj, index);
        return obj;
    }
    
    public void ArticleDataOnDemand.setAuthor(Article obj, int index) {
        String author = "author_" + index;
        obj.setAuthor(author);
    }
    
    public void ArticleDataOnDemand.setBeginDate(Article obj, int index) {
        Date beginDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setBeginDate(beginDate);
    }
    
    public void ArticleDataOnDemand.setContent(Article obj, int index) {
        String content = "content_" + index;
        obj.setContent(content);
    }
    
    public void ArticleDataOnDemand.setLabel(Article obj, int index) {
        String label = "label_" + index;
        obj.setLabel(label);
    }
    
    public void ArticleDataOnDemand.setTitle(Article obj, int index) {
        String title = "title_" + index;
        obj.setTitle(title);
    }
    
    public void ArticleDataOnDemand.setUpdateDate(Article obj, int index) {
        Date updateDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setUpdateDate(updateDate);
    }
    
    public Article ArticleDataOnDemand.getSpecificArticle(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Article obj = data.get(index);
        Long id = obj.getId();
        return Article.findArticle(id);
    }
    
    public Article ArticleDataOnDemand.getRandomArticle() {
        init();
        Article obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Article.findArticle(id);
    }
    
    public boolean ArticleDataOnDemand.modifyArticle(Article obj) {
        return false;
    }
    
    public void ArticleDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Article.findArticleEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Article' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Article>();
        for (int i = 0; i < 10; i++) {
            Article obj = getNewTransientArticle(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
