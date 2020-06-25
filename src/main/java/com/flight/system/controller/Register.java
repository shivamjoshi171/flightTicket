package com.flight.system.controller;

import java.util.ArrayList;
import java.util.Optional;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import com.flight.system.model.BookingDetails;
import com.flight.system.model.Cities;
import com.flight.system.model.Flight;
import com.flight.system.model.PassengerDetails;
import com.flight.system.model.User;
import com.flight.system.repos.BookingDetailsRepo;
import com.flight.system.repos.CitiesRepo;
import com.flight.system.repos.FlightRepo;
import com.flight.system.repos.PassengerDetailsRepo;
import com.flight.system.repos.UserRepo;

@Controller
public class Register {
	@Autowired
	CitiesRepo citiRepo;

	@Autowired
	FlightRepo flightRepo;

	@Autowired
	UserRepo userRepo;

	@Autowired
	PassengerDetailsRepo passRepo;

	@Autowired
	BookingDetailsRepo bookingRepo;

	@GetMapping("/home")
	public String registerNewUser(ModelMap map, HttpServletRequest request) {
		ArrayList<String> cities = (ArrayList<String>) citiRepo.getAllCityCode();
		map.addAttribute("citylist", cities);
		return "home";
	}

	

	@PostMapping("/login")
	public String checkAndLogin(HttpServletRequest request) {
		if (userRepo.userExist(request.getParameter("emailId"), request.getParameter("password")) >= 1) {
			request.getSession().setAttribute("userEmail", request.getParameter("emailId"));
			return "redirect:/home";
		} else {
			return "login";
		}
	}

	@GetMapping("/register")
	public String registration(User user) {
		return "register";
	}

	@GetMapping("/userProfile")
	public String userProfile(ModelMap map, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("userEmail");
		User user = userRepo.findUserByEmail(email);
		map.addAttribute("user", user);
		return "UserProFile";
	}

	@GetMapping("/updateInfo")
	public String updateInfo() {
		return "updateInfo";
	}

	@PostMapping("/updateData")
	public String updateData(HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("userEmail");
		User user = userRepo.findUserByEmail(email);
		user.setFirstName(request.getParameter("firstName"));
		user.setLastName(request.getParameter("lastName"));
		user.setMobileNumber(request.getParameter("mobileNumber"));
		if (!user.getEmailId().equals(request.getParameter("emailId")))
			request.getSession().setAttribute("userEmail", request.getParameter("emailId"));
		user.setEmailId(request.getParameter("emailId"));
		userRepo.save(user);
		return "redirect:/userProfile";
	}

	@PostMapping("/submitData")
	public String submitUserData(User user, HttpServletRequest request) {
		request.getSession().setAttribute("userLogin", false);
		userRepo.save(user);
		return "redirect:/home";
	}

	@PostMapping("/result")
	public String flights(HttpServletRequest request, ModelMap map) {
		System.out.println(request.getParameter("arival"));
		String departure = request.getParameter("departure");
		ArrayList<Flight> data = (ArrayList<Flight>) flightRepo.getAllFlight(departure);
		map.addAttribute("allFlights", data);
		request.getSession().setAttribute("travelDate", request.getParameter("travelDate"));
		request.getSession().setAttribute("seatType", request.getParameter("seatType"));
		request.getSession().setAttribute("numberAdult", request.getParameter("numberOfAdult"));
		request.getSession().setAttribute("numberChild", request.getParameter("numberOfChild"));
		request.getSession().setAttribute("numberInfant", request.getParameter("numberOfInfant"));
		System.out.println(request.getParameter("numberOfInfant"));
		return "result";
	}

	@GetMapping("bookTicket/{flightId}")
	public String bookTicket(@PathVariable String flightId, ModelMap map, HttpServletRequest request) {
		Optional<Flight> flight = flightRepo.findById(flightId);
		Flight temp = flight.get();
		map.addAttribute("flightDetail", temp);
		map.addAttribute("numberAdult", request.getSession().getAttribute("numberAdult"));
		map.addAttribute("numberChild", request.getSession().getAttribute("numberChild"));
		map.addAttribute("numberInfant", request.getSession().getAttribute("numberInfant"));
		int totalPrice = 0;
		if (Integer.parseInt((String) request.getSession().getAttribute("numberAdult")) >= 1) {
			totalPrice += Integer.parseInt(temp.getSingleTicketPrice())
					* Integer.parseInt((String) request.getSession().getAttribute("numberAdult"));
		}
		if (Integer.parseInt((String) request.getSession().getAttribute("numberAdult")) >= 1) {
			totalPrice += Integer.parseInt(temp.getSingleTicketPrice())
					* Integer.parseInt((String) request.getSession().getAttribute("numberChild"));
		}
		if (Integer.parseInt((String) request.getSession().getAttribute("numberAdult")) >= 1) {
			totalPrice += Integer.parseInt(temp.getSingleTicketPrice())
					* Integer.parseInt((String) request.getSession().getAttribute("numberInfant"));
		}
		map.addAttribute("totalPrice", totalPrice);
		request.getSession().setAttribute("totalPrice", totalPrice);
		request.getSession().setAttribute("flightId", flightId);
		return "bookTicket";
	}

	@GetMapping("/updateFlightDetails/{flightId}")
	public String updateFlightDetails(@PathVariable String flightId, ModelMap map) {
		Optional<Flight> flight = flightRepo.findById(flightId);
		map.addAttribute("flightDetail", flight.get());
		return "updateFlight";
	}

	@PostMapping("/updateFlight")
	public String updateFlightData(Flight flight, HttpServletRequest request) {
		Cities departureCity = citiRepo.findByCityCode(request.getParameter("depCity"));
		Cities arivalCity = citiRepo.findByCityCode(request.getParameter("arrCity"));
		flight.setDepartureCity(departureCity);
		flight.setArivalCity(arivalCity);
		flightRepo.save(flight);
		return "redirect:/dashboard";
	}

	@GetMapping("/dashboard")
	public String dashboard(ModelMap map) {
		map.addAttribute("flightList", flightRepo.findAll());
		return "dashboard";
	}

	@GetMapping("/addNewFlight")
	public String addNewFlight() {
		return "addNewFlight";
	}

	@PostMapping("/payment")
	public String payment(HttpServletRequest request) {

		for (int i = 0; i < Integer.parseInt((String) request.getSession().getAttribute("numberAdult")); i++) {
			String tempF = "AdultF_" + Integer.toString(i + 1);
			String tempL = "AdultL" + Integer.toString(i + 1);
			request.getSession().setAttribute(tempF, request.getParameter(tempF));
			request.getSession().setAttribute(tempL, request.getParameter(tempL));
		}
		for (int i = 0; i < Integer.parseInt((String) request.getSession().getAttribute("numberChild")); i++) {
			String tempF = "ChildF_" + Integer.toString(i + 1);
			String tempL = "ChildL" + Integer.toString(i + 1);
			request.getSession().setAttribute(tempF, request.getParameter(tempF));
			request.getSession().setAttribute(tempL, request.getParameter(tempL));
		}
		for (int i = 0; i < Integer.parseInt((String) request.getSession().getAttribute("numberInfant")); i++) {
			String tempF = "InfantF_" + Integer.toString(i + 1);
			String tempL = "InfantL" + Integer.toString(i + 1);
			request.getSession().setAttribute(tempF, request.getParameter(tempF));
			request.getSession().setAttribute(tempL, request.getParameter(tempL));
		}
		return "redirect:/paymentPage";
	}

	@GetMapping("/paymentPage")
	public String makePayment() {
		return "paymentPage";
	}

	@PostMapping("/pay")
	public String pay(HttpServletRequest request) {
		Optional<Flight> flight = flightRepo.findById((String) request.getSession().getAttribute("flightId"));
		User user = userRepo.findUserByEmail((String) request.getSession().getAttribute("userEmail"));
		System.out.println(user.getId());
		BookingDetails bookingDetails = new BookingDetails();
		bookingDetails.setFlight(flight.get());
		bookingDetails.setBookingDate((String)request.getSession().getAttribute("travelDate"));
		bookingDetails.setUser(user);
		bookingRepo.save(bookingDetails);
		for (int i = 0; i < Integer.parseInt((String) request.getSession().getAttribute("numberAdult")); i++) {
			String tempF = "AdultF_" + Integer.toString(i + 1);
			String tempL = "AdultL" + Integer.toString(i + 1);
			String fname = (String) request.getSession().getAttribute(tempF);
			String lname = (String) request.getSession().getAttribute(tempL);
			passRepo.save(new PassengerDetails(bookingDetails, user, fname, lname));
		}
		for (int i = 0; i < Integer.parseInt((String) request.getSession().getAttribute("numberChild")); i++) {
			String tempF = "ChildF_" + Integer.toString(i + 1);
			String tempL = "ChildL" + Integer.toString(i + 1);
			String fname = (String) request.getSession().getAttribute(tempF);
			String lname = (String) request.getSession().getAttribute(tempL);
			passRepo.save(new PassengerDetails(bookingDetails, user, fname, lname));
		}
		for (int i = 0; i < Integer.parseInt((String) request.getSession().getAttribute("numberInfant")); i++) {
			String tempF = "InfantF_" + Integer.toString(i + 1);
			String tempL = "InfantL" + Integer.toString(i + 1);
			String fname = (String) request.getSession().getAttribute(tempF);
			String lname = (String) request.getSession().getAttribute(tempL);
			passRepo.save(new PassengerDetails(bookingDetails, user, fname, lname));
		}
		ArrayList<PassengerDetails> list = (ArrayList<PassengerDetails>) passRepo.getTravllerDetail(user.getId(),
				bookingDetails.getBookingId());
		bookingDetails.setPassengerDetails(list);
		bookingRepo.save(bookingDetails);
		return "redirect:/home";
	}
	
	@GetMapping("/pastBooking")
	public String viewPastBooking(HttpServletRequest request, ModelMap map) {
		User user = userRepo.findUserByEmail((String) request.getSession().getAttribute("userEmail"));
		ArrayList<BookingDetails> list=(ArrayList<BookingDetails>) bookingRepo.getAllDetail(user.getId());
		ArrayList<Flight> list2= new ArrayList<Flight>();
		for(int i=0;i<list.size();i++) {
			list2.add(list.get(i).getFlight());
		}
		map.addAttribute("bookDetail", list);
		map.addAttribute("flight", list2);
		return "pastBooking";
	}
}
