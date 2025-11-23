package org.java.queryservice.service;

import org.java.queryservice.dto.EventLayoutDTO;
import org.java.queryservice.dto.TicketInfoDTO;
import org.java.queryservice.dto.ZoneDTO;

import java.math.BigDecimal;
import java.util.List;

public interface QueryServiceInterface {
	TicketInfoDTO getTicket(String ticketId);

	int countTicketSoldByEvent(String eventId);

	BigDecimal sumRevenueByVenueAndEvent(String venueId, String eventId);

	List<TicketInfoDTO> getAllSoldTickets();

	List<ZoneDTO> getEventLayout(String eventId);
}
