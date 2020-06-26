package com.flight.system.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
@Entity
public class PassengerDetails {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private String id;
	@ManyToOne(targetEntity = BookingDetails.class)
	@JoinColumn(name = "booking_id", referencedColumnName = "bookingId")
	private BookingDetails bookingId;
	@ManyToOne(targetEntity = User.class)
	@JoinColumn(name = "user_id", referencedColumnName = "id")
	private User userId;
	private String firstName;
	private  String lastName;
		
	public PassengerDetails(BookingDetails bookingId, User userId, String firstName, String lastName) {
		super();
		this.bookingId = bookingId;
		this.userId = userId;
		this.firstName = firstName;
		this.lastName = lastName;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public PassengerDetails() {
		super();
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public BookingDetails getBookingId() {
		return bookingId;
	}
	public void setBookingId(BookingDetails bookingId) {
		this.bookingId = bookingId;
	}
	public User getUserId() {
		return userId;
	}
	public void setUserId(User userId) {
		this.userId = userId;
	}
	
}
