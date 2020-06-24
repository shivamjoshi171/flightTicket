package com.flight.system.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.flight.system.model.PassengerDetails;
@Repository
public interface PassengerDetailsRepo extends JpaRepository<PassengerDetails, String>{
	
	@Query(value="SELECT * FROM PASSENGER_DETAILS WHERE user_id=:uid AND booking_id=:bid",nativeQuery = true)
	List<PassengerDetails> getTravllerDetail(@Param("uid")String uid,@Param("bid")String bid);

}
