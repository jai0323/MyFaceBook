package com.jai;

import java.sql.Blob;

public class Wpost {
    int wid;
    String post,sender,dop;
    Blob img;
	public Wpost(int wid, String post, String sender, String dop, Blob img) {
		this.wid = wid;
		this.post = post;
		this.sender = sender;
		this.dop = dop;
		this.img = img;
	}
	
	public Blob getImg() {
		return img;
	}

	public void setImg(Blob img) {
		this.img = img;
	}

	public int getWid() {
		return wid;
	}
	public void setWid(int wid) {
		this.wid = wid;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getDop() {
		return dop;
	}
	public void setDop(String dop) {
		this.dop = dop;
	}
	public Wpost() {
		
	}
	public Wpost(int wid, String post, String sender, String dop) {
		super();
		this.wid = wid;
		this.post = post;
		this.sender = sender;
		this.dop = dop;
	}
    
}
