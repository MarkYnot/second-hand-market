package cn.second_hand.user.domain;

import org.bson.types.ObjectId;

public class User {
	private String email;
	private String password;
	private String verifyCode;
	private ObjectId oid;
	public ObjectId getOid() {
		return oid;
	}
	public void setOid(ObjectId oid) {
		this.oid = oid;
	}
	private double balance;
	private boolean activeStatus;
	
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	public boolean isActiveStatus() {
		return activeStatus;
	}
	public void setActiveStatus(boolean activeStatus) {
		this.activeStatus = activeStatus;
	}
	public String getVerifyCode() {
		return verifyCode;
	}
	public void setVerifyCode(String verifyCode) {
		this.verifyCode = verifyCode;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "User [email=" + email + ", password=" + password + ", verifyCode=" + verifyCode + ", activeStatus="
				+ activeStatus + ", saleApplyStatus="  + "]";
	}
	
	
}
