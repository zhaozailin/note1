package com.zzl.mynote.vo;

import java.util.Date;

public class ArticleVO {

	private Long id;
	/**
     */
	private String simpleContent;

	/**
     */
	private String title;

	/**
     */
	private String author;

	/**
     */
	private Date beginDate;

	/**
     */
	private Date updateDate;

	/**
     */
	private String label;

	/**
     */
	private String type;

	public Long getId()
	{
		return id;
	}

	public void setId(Long id)
	{
		this.id = id;
	}

	public String getSimpleContent()
	{
		return simpleContent;
	}

	public void setSimpleContent(String simpleContent)
	{
		this.simpleContent = simpleContent;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getAuthor()
	{
		return author;
	}

	public void setAuthor(String author)
	{
		this.author = author;
	}

	public Date getBeginDate()
	{
		return beginDate;
	}

	public void setBeginDate(Date beginDate)
	{
		this.beginDate = beginDate;
	}

	public Date getUpdateDate()
	{
		return updateDate;
	}

	public void setUpdateDate(Date updateDate)
	{
		this.updateDate = updateDate;
	}

	public String getLabel()
	{
		return label;
	}

	public void setLabel(String label)
	{
		this.label = label;
	}

	public String getType()
	{
		return type;
	}

	public void setType(String type)
	{
		this.type = type;
	}
}
