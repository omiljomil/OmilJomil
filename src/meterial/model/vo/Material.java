package meterial.model.vo;

import java.sql.Date;

public class Material {
	private int mtrlNo;
	private int prodNo;
	private String mtrlName;
	private String status;
	private Date mtrlCt;//생성일

	public Material() {}

	public Material(int mtrlNo, int prodNo, String mtrlName, String status, Date mtrlCt) {
		super();
		this.mtrlNo = mtrlNo;
		this.prodNo = prodNo;
		this.mtrlName = mtrlName;
		this.status = status;
		this.mtrlCt = mtrlCt;
	}

	public int getMtrlNo() {
		return mtrlNo;
	}

	public void setMtrlNo(int mtrlNo) {
		this.mtrlNo = mtrlNo;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public String getMtrlName() {
		return mtrlName;
	}

	public void setMtrlName(String mtrlName) {
		this.mtrlName = mtrlName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getMtrlCt() {
		return mtrlCt;
	}

	public void setMtrlCt(Date mtrlCt) {
		this.mtrlCt = mtrlCt;
	}

	@Override
	public String toString() {
		return "Meterial [mtrlNo=" + mtrlNo + ", prodNo=" + prodNo + ", mtrlName=" + mtrlName + ", status=" + status
				+ ", mtrlCt=" + mtrlCt + "]";
	}
	
	
	
}
