package com.flight.system.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class Flight {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private String flightId;
	@OneToOne(targetEntity = Cities.class)
	@JoinColumn(name = "departure_city",referencedColumnName = "cityCode")
	private Cities departureCity;
	@OneToOne(targetEntity = Cities.class)
	@JoinColumn(name = "arival_city",referencedColumnName = "cityCode")
	private Cities arivalCity;
	private String singleTicketPrice;
	private String departureTime;
	private String arrivalTime;
	private String availableSeats;
	public String getAvailableSeats() {
		return availableSeats;
	}
	public void setAvailableSeats(String availableSeats) {
		this.availableSeats = availableSeats;
	}
	public String getArrivalTime() {
		return arrivalTime;
	}
	public void setArrivalTime(String arrivalTime) {
		this.arrivalTime = arrivalTime;
	}
	public String getFlightId() {
		return flightId;
	}
	public void setFlightId(String flightId) {
		this.flightId = flightId;
	}
	public Cities getDepartureCity() {
		return departureCity;
	}
	public void setDepartureCity(Cities departureCity) {
		this.departureCity = departureCity;
	}
	public Cities getArivalCity() {
		return arivalCity;
	}
	public void setArivalCity(Cities arivalCity) {
		this.arivalCity = arivalCity;
	}
	public String getSingleTicketPrice() {
		return singleTicketPrice;
	}
	public void setSingleTicketPrice(String singleTicketPrice) {
		this.singleTicketPrice = singleTicketPrice;
	}
	public String getDepartureTime() {
		return departureTime;
	}
	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}
}
