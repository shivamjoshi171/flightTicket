package com.flight.system.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.flight.system.model.User;
@Repository
public interface UserRepo extends JpaRepository<User, String>{
	
	@Query(value = "SELECT count(*) from User where email_id=:emid AND password=:pass ",nativeQuery = true)
	int userExist(@Param("emid") String emid,@Param("pass") String pass);
	@Query(value = "SELECT * FROM USER where email_id=:emid",nativeQuery = true)
	User findUserByEmail(@Param("emid")String emid);

}
