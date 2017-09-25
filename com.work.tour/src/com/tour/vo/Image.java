package com.tour.vo;

public class Image {
	private String url=null;
	private String words = null;
	private String id = null;
	private String introduce = null;
	private String description = null;
	private boolean collection_deny = false;
	public void setUrl(String urls){
		url = urls;
	}
	public String getUrl(){
		return url;
	}
	public void setWords(String word){
		words = word;
	}
	public String getWords(){
		return words;
	}
	public void setId(String Id){
		id = Id;
	}
	public String getId(){
		return this.id;
	}
	public void setIntroduce(String Introduce){
		this.introduce = Introduce;
	}
	public String getIntroduce(){
		return this.introduce;
	}
	public void setDescription(String Description){
		this.description = Description;
	}
	public String getDescription(){
		return this.description;
	}
	public void setCollection_deny(boolean Collection_deny){
		this.collection_deny = Collection_deny;
	}
	public boolean getCollection_deny(){
		return this.collection_deny;
	}
}
