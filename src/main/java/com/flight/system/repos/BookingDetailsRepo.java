package com.flight.system.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.flight.system.model.BookingDetails;
@Repository
public interface BookingDetailsRepo extends JpaRepository<BookingDetails, String>{
	
	

}
