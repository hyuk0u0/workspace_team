package kr.co.domain;

import java.io.Serializable;
import java.util.Arrays;

public class BoardDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int bno;
	private String title;
	private int cno;
	private int gno;
	private String fullName;
	private String regDate;
	private String[] files;
	
	public BoardDTO() {
		// TODO Auto-generated constructor stub
	}

	public BoardDTO(int bno, String title, int cno, int gno, String fullName, String regDate, String[] files) {
		super();
		this.bno = bno;
		this.title = title;
		this.cno = cno;
		this.gno = gno;
		this.fullName = fullName;
		this.regDate = regDate;
		this.files = files;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getGno() {
		return gno;
	}

	public void setGno(int gno) {
		this.gno = gno;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + bno;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BoardDTO other = (BoardDTO) obj;
		if (bno != other.bno)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "BoardDTO [bno=" + bno + ", title=" + title + ", cno=" + cno + ", gno=" + gno + ", fullName=" + fullName
				+ ", regDate=" + regDate + ", files=" + Arrays.toString(files) + "]";
	}
	
	
	
}
