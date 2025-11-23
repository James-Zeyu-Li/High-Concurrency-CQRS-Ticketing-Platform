import {http} from "./http";

export interface Zone {
  zoneId: number;
  posX: number;
  posY: number;
  width: number;
  height: number;
  ticketPrice: number;
}

export interface SeatBitmapResp {
  seatMapBase64: string;
}

export async function getEventLayout(eventId: string) {
  const {data} = await http.get<Zone[]>(
      `/v1/tickets/events/${eventId}/layout`
  )
  return data
}

export async function getSeatBitmap(eventId: string, zoneId: string) {
  const {data} = await http.get<SeatBitmapResp>(
      `/v1/tickets/events/${eventId}/zones/${zoneId}/seatMap`
  )
  return data
}