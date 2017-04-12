package com.wzj.ms.order;

public class Order extends Common
{
	
	  private int price;
	  private int storage;
	private String image;
	private int newNum;
	private int newNumB;
	private int num;
	private int numAll;
	private int number;
	private String password;
	private int role;	private int ty;
	private String session;
	
	  public int getPrice() {
		return price;
	}


	public int getTy() {
		return ty;
	}


	public void setTy(int ty) {
		this.ty = ty;
	}


	public int getNumAll() {
		return numAll;
	}


	public String getPassword() {
		return password;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public int getStorage() {
		return storage;
	}


	public void setStorage(int storage) {
		this.storage = storage;
	}


	public String getImage() {
	    return this.image;
	  }


	public int getNewNum()
	  {
	    return this.newNum;
	  }


	public int getNewNumB() {
	    return this.newNumB;
	  }


	public int getNum() {
	    return this.num;
	  }


	public int getNumber() {
	    return this.number;
	  }


	public int getRole() {
	    return this.role;
	  }


	public String getSession() {
	    return this.session;
	  }


	public void setImage(String image) {
	    this.image = image;
	  }


	public void setNewNum(int newNum) {
	    this.newNum = newNum;
	  }


	public void setNewNumB(int newNumB) {
	    this.newNumB = newNumB;
	  }


	public void setNum(int num) {
	    this.num = num;
	  }


	public void setNumAll(int numAll) {
	    this.numAll = numAll;
	  }


	public void setNumber(int number) {
	    this.number = number;
	  }


	public void setPassword(String password) {
	    this.password = password;
	  }


	public void setRole(int role) {
	    this.role = role;
	  }


	public void setSession(String session) {
	    this.session = session;
	  }
	

	public String toString() {
	    return "Order [" + "orderid=" + this.getOrderid() + "gname=" + this.getGname() +"cname=" + this.getCname() +", goodsid=" + getGoodsid() + 
	      ", cusid=" + getCusid() +  ", time=" + getTime() + ", state=" + getState() + ", oprice=" + getOprice() + ", nprice=" + getNprice()  + ", amount=" + getAmount()  + ", sign=" + getSign()  + ", type=" + getType() + ", cname=" + getCname() + ",gname=" + getGname()+"]                ";
	  }
	

	
	 
}