package com.book.warm.vo;

import java.sql.Timestamp;

//占쏙옙占쏙옙 클占쏙옙占쏙옙 占쏙옙占쏙옙底� 占싹쇽옙占쏙옙. 占쏙옙占쏙옙占쌔쇽옙 占싹몌옙 占싫됩니댐옙.
public class LogBoardVO { // 占쏙옙占쏙옙占쏙옙占� SQL
	private int write_no; // 占쏙옙球占싫� write_no
	private String user_id; // 占쏙옙占쏙옙占� ID user_id
	private Timestamp write_written_date; // 占쌜쇽옙占쏙옙 write_written_date
	private String ISBN; // 占쏙옙占쏙옙占쏙옙호 ISBN
	private String write_buy_date; // 占쏙옙占쏙옙占쏙옙(占쎈여占쏙옙) write_buy_date
	private int read_amount; // 占쏙옙占쏙옙占쏙옙占쏙옙 read_amount (占쏙옙占쏙옙 占쏙옙)
	private int read_stop; // 책占쏙옙占쏙옙 read_stop
	private int read_star; // 占쏙옙占쏙옙 read_star
	public int getWrite_no() {
		return write_no;
	}
	public void setWrite_no(int write_no) {
		this.write_no = write_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Timestamp getWrite_written_date() {
		return write_written_date;
	}
	public void setWrite_written_date(Timestamp write_written_date) {
		this.write_written_date = write_written_date;
	}
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public String getWrite_buy_date() {
		return write_buy_date;
	}
	public void setWrite_buy_date(String write_buy_date) {
		this.write_buy_date = write_buy_date;
	}
	public int getRead_amount() {
		return read_amount;
	}
	public void setRead_amount(int read_amount) {
		this.read_amount = read_amount;
	}
	public int getRead_stop() {
		return read_stop;
	}
	public void setRead_stop(int read_stop) {
		this.read_stop = read_stop;
	}
	public int getRead_star() {
		return read_star;
	}
	public void setRead_star(int read_star) {
		this.read_star = read_star;
	}
	public LogBoardVO(int write_no, String user_id, Timestamp write_written_date, String iSBN, String write_buy_date,
			int read_amount, int read_stop, int read_star) {
		super();
		this.write_no = write_no;
		this.user_id = user_id;
		this.write_written_date = write_written_date;
		ISBN = iSBN;
		this.write_buy_date = write_buy_date;
		this.read_amount = read_amount;
		this.read_stop = read_stop;
		this.read_star = read_star;
	}
	public LogBoardVO() {
		super();
	}

	
	
}
