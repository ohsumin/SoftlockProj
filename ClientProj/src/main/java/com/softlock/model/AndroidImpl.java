package com.softlock.model;

import java.util.ArrayList;

public interface AndroidImpl {
	
	public void memjoinAction(String mem_id, String mem_pw, String mem_name, String mem_birth, 
			String mem_phone, String mem_gender, String mem_email, String mem_auth);
	
	public ArrayList<HospitalDTO> searchHp(HospitalDTO hDTO);
	
	public ArrayList<ReservationDTO> reservationPage(int resv_idx);
	
}
