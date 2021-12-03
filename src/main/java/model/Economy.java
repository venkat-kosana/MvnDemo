package model;

public class Economy {
	private String type,dateString,name,password;
	private int amt,totalinc,totalexp,upiid;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getUpiid() {
		return upiid;
	}
	public void setUpiid(int upiid) {
		this.upiid = upiid;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getAmt() {
		return amt;
	}
	public void setAmt(int amt) {
		this.amt = amt;
	}
	public String getDateString() {
		return dateString;
	}
	public void setDateString(String dateString) {
		this.dateString = dateString;
	}
	public int getTotalexp() {
		return totalexp;
	}
	
	public void setTotalexp(int totalexp) {
		this.totalexp = totalexp;
	}
	public int getTotalinc() {
		return totalinc;
	}
	public void setTotalinc(int totalinc) {
		this.totalinc = totalinc;
	}

}
