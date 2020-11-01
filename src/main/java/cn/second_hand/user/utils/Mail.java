package cn.second_hand.user.utils;

import java.util.ArrayList;
import java.util.List;


public class Mail {
	private String from;
	private StringBuilder toAddress = new StringBuilder();
	private StringBuilder ccAddress = new StringBuilder();
	private StringBuilder bccAddress = new StringBuilder();
	
	private String subject;
	private String content;
	
	private List<AttachBean> attachList = new ArrayList<AttachBean>();
	
	public Mail() {}
	
	public Mail(String from, String to) {
		this(from, to, null, null);
	}
	
	public Mail(String from, String to, String subject, String content) {
		this.from = from;
		this.toAddress.append(to);
		this.subject = subject;
		this.content = content;
	}
	

	public void setFrom(String from) {
		this.from = from;
	}
	
	
	public String getFrom() {
		return from;
	}
	

	public String getSubject() {
		return subject;
	}


	public void setSubject(String subject) {
		this.subject = subject;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getToAddress() {
		return toAddress.toString();
	}


	public String getCcAddress() {
		return ccAddress.toString();
	}


	public String getBccAddress() {
		return bccAddress.toString();
	}


	public void addToAddress(String to) {
		if(this.toAddress.length() > 0) {
			this.toAddress.append(",");
		}
		this.toAddress.append(to);
	}


	public void addCcAddress(String cc) {
		if(this.ccAddress.length() > 0) {
			this.ccAddress.append(",");
		}
		this.ccAddress.append(cc);
	}


	public void addBccAddress(String bcc) {
		if(this.bccAddress.length() > 0) {
			this.bccAddress.append(",");
		}
		this.bccAddress.append(bcc);
	}
	

	public void addAttach(AttachBean attachBean) {
		this.attachList.add(attachBean);
	}
	

	public List<AttachBean> getAttachs() {
		return this.attachList;
	}
}
