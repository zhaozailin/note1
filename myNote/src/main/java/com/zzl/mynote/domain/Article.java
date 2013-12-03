package com.zzl.mynote.domain;

import java.util.Date;
import java.util.List;

import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.core.annotation.Order;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Article {

	/**
     */
	@Lob
	private String content;

	/**
     */
	private String title;

	/**
     */
	private String author;

	/**
     */
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yy-MM-dd hh:mm:ss")
	private Date beginDate;

	/**
     */
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yy-MM-dd hh:mm:ss")
	@Order
	private Date updateDate;

	/**
     */
	private String label;

	/**
     */
	@ManyToOne
	private ArticleType type;

	@SuppressWarnings("unchecked")
	public static List<Article> queryList(Integer pageNo, Integer limit, String keyword) {
		if(null == keyword) {
			keyword = "";
		}
		List<Article> list = entityManager().createQuery("select a from article a where a.content like %" + keyword + "% order by a.updateDate")
				.setFirstResult(pageNo * limit + 1)
				.setMaxResults(limit)
				.getResultList();
		return list;
	}
	
	public static long queryAllList(String keyword) {
		if(null == keyword) {
			keyword = "";
		}
		return (long) entityManager().createQuery("select count(*) from article a where a.content like %" + keyword + "%").getFirstResult();
	}
}
