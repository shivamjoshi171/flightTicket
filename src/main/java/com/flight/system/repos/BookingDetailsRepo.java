package com.flight.system.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.flight.system.model.BookingDetails;
@Repository
public interface BookingDetailsRepo extends JpaRepository<BookingDetails, String>{
	
	@Query(value = "SELECT * FROM BOOKING_DETAILS where user_id=:uid",nativeQuery = true)
	List<BookingDetails> getAllDetail(@Param("uid")String uid);

}
