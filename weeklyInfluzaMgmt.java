package buaa.sem.ps.mainBaseData.model;

import java.util.Date;

public class weeklyInfluzaMgmt implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;
	private int id = 0;
	private String weekNo;
	private double sourthIli = 0;
	private double northIli = 0;
	private double nationIli = 0;
	private String remark;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getWeekNo() {
		return weekNo;
	}
	public void setWeekNo(String weekNo) {
		this.weekNo = weekNo;
	}
	public double getSourthIli() {
		return sourthIli;
	}
	public void setSourthIli(double sourthIli) {
		this.sourthIli = sourthIli;
	}
	public double getNorthIli() {
		return northIli;
	}
	public void setNorthIli(double northIli) {
		this.northIli = northIli;
	}
	public double getNationIli() {
		return nationIli;
	}
	public void setNationIli(double nationIli) {
		this.nationIli = nationIli;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
	
	
}
